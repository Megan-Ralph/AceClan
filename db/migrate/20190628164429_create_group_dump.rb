class CreateGroupDump < ActiveRecord::Migration[5.2]
  def change
    create_table :group_dumps do |t|
      t.integer :forum_group_id
      t.string :name
    end
  end
end
