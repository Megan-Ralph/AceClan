class CreateJobListings < ActiveRecord::Migration[5.2]
  def change
    create_table :job_listings do |t|
      t.string :name
      t.text :description
      t.string :viewable_rank_ids
      t.integer :created_by
      t.boolean :active
    end
  end
end
