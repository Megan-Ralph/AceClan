class AddForumPrimaryGroupIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :forum_primary_group_id, :integer
  end
end
