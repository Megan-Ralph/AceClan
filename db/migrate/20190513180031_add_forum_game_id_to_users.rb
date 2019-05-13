class AddForumGameIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :forum_game_id, :integer
  end
end
