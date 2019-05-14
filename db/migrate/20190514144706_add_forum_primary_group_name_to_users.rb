class AddForumPrimaryGroupNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :forum_primary_group_name, :string
  end
end
