class CreateSubTabs < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_tabs do |t|
      t.integer :tab_id
      t.integer :rank
      t.string :link
      t.string :name
    end
  end
end
