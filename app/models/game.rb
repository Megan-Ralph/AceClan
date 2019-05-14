# == Schema Information
#
# Table name: games
#
#  id            :bigint           not null, primary key
#  name          :string(255)
#  description   :text(65535)
#  forum_game_id :integer
#

class Game < ApplicationRecord
  has_one_attached :game_image

end
