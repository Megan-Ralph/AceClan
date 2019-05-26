# == Schema Information
#
# Table name: users
#
#  id                       :bigint           not null, primary key
#  email                    :string(255)      default(""), not null
#  encrypted_password       :string(255)      default(""), not null
#  reset_password_token     :string(255)
#  reset_password_sent_at   :datetime
#  remember_created_at      :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  admin                    :boolean
#  username                 :string(255)
#  game_id                  :integer
#  dob                      :datetime
#  location                 :string(255)
#  discord_username         :string(255)
#  mic                      :boolean
#  what_game_why            :text(65535)
#  console_gaming           :text(65535)
#  hear_ace                 :text(65535)
#  referring_member         :string(255)
#  admin_interest           :boolean
#  clan_before              :boolean
#  vpn_connection           :boolean
#  confirmation_token       :string(255)
#  confirmed_at             :datetime
#  confirmation_sent_at     :datetime
#  enrolled                 :boolean
#  applied                  :boolean
#  forum_game_id            :integer
#  forum_primary_group_id   :integer
#  forum_primary_group_name :string(255)
#  forum_secondary_groups   :string(255)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #belongs_to :game
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_update :forum_enrollment

  def forum_enrollment
    if enrolled != true && confirmed_at.present?
      user_enroll = ForumEnrollment.new(self.id)
      user_enroll.enroll
    end
  end

  def forum_grab
    if enrolled == true
      grab = ForumEnrollment.new(self.id)
      grab.get_games_and_groups
    end
  end

end
