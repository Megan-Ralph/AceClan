class AddSubNavToTabs < ActiveRecord::Migration[5.2]
  def change
    add_column :tabs, :sub_nav, :boolean
  end
end
