class AddLinkToTabs < ActiveRecord::Migration[5.2]
  def change
    add_column :tabs, :link, :string
  end
end
