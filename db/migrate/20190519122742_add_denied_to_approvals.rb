class AddDeniedToApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :approvals, :denied, :boolean, default: false
  end
end
