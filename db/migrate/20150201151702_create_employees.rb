class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :username
      t.string :name
      t.string :job_title
      t.string :email
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
