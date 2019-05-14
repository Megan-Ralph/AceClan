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
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #belongs_to :game
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_update :forum_enrollment
  #after_update :forum_application

  def forum_enrollment
    if enrolled == false && confirmed_at == true
      user_enroll = ForumEnrollment.new(id)
      user_enroll.enroll
    end
  end

  def forum_application
    if enrolled == true && confirmed_at == true && applied == false
      user_apply = ForumEnrollment.new(id)
      user_apply.apply
    end
  end

  def find_game_group_id
    #
  end

end
