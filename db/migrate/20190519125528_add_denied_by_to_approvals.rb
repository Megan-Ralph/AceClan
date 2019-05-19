class AddDeniedByToApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :approvals, :denied_by, :integer
  end
end
