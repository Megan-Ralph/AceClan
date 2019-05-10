class AddAppliedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :applied, :boolean
  end
end
