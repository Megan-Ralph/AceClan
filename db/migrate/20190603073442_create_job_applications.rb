class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.integer :user_id
      t.integer :listing_id
      t.text :description
      t.integer :status
    end
  end
end
