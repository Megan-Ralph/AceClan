class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :game_id, :integer
    add_column :users, :dob, :datetime
    add_column :users, :location, :string
    add_column :users, :discord_username, :string
    add_column :users, :mic, :boolean
    add_column :users, :what_game_why, :text
    add_column :users, :console_gaming, :text
    add_column :users, :hear_ace, :text
    add_column :users, :referring_member, :string
    add_column :users, :admin_interest, :boolean
    add_column :users, :clan_before, :boolean
    add_column :users, :vpn_connection, :boolean
  end
end
