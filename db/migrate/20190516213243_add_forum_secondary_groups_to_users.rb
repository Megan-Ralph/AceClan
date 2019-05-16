class AddForumSecondaryGroupsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :forum_secondary_groups, :string
  end
end
