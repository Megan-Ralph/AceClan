class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :forum_enrollment

  def forum_enrollment
    user_enroll = ForumEnrollment.new(id)
    user_enroll.enroll
  end

end
