class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.integer :user_id
      t.integer :game_id
      t.datetime :created_at
      t.integer :approved_by
      t.datetime :approved_at
    end
  end
end
