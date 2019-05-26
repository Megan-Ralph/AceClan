# == Schema Information
#
# Table name: approvals
#
#  id          :bigint           not null, primary key
#  user_id     :integer
#  game_id     :integer
#  created_at  :datetime
#  approved_by :integer
#  approved_at :datetime
#  denied      :boolean          default(FALSE)
#  denied_by   :integer
#  denied_at   :datetime
#

class Approval < ApplicationRecord
  belongs_to :user
  belongs_to :game

  after_update :forum_application


  def forum_application
    if approved_by && approved_at
      user_init = ForumEnrollment.new(user_id)
      user_init.apply
    end
  end

  def complete?
    approved_by.present? || denied_by.present?
  end

end
