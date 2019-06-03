class AddContentToSubTabs < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_tabs, :content, :text
  end
end
