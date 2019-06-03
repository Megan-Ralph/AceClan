class AddRankToTabs < ActiveRecord::Migration[5.2]
  def change
    add_column :tabs, :rank, :integer
  end
end
