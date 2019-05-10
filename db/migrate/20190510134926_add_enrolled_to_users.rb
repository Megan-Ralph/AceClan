class AddEnrolledToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :enrolled, :boolean
  end
end
