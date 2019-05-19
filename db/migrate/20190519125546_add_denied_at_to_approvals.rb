class AddDeniedAtToApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :approvals, :denied_at, :datetime
  end
end
