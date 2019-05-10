class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :game
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_update :forum_enrollment
  after_update :forum_application

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
