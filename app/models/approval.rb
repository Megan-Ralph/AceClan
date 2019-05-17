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
#

class Approval < ApplicationRecord
  belongs_to :user
  belongs_to :game
end
