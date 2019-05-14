class AddForumGameIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :forum_game_id, :integer
  end
end
