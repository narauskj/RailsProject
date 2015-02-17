class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.date :date
      t.integer :asset_id
      t.integer :user_id
      t.integer :location_id
      t.string :room

      t.timestamps null: false
    end
  end
end
