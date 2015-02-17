class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_type
      t.string :asset_tag
      t.string :serial_nr
      t.string :po
      t.date :po_date
      t.decimal :price
      t.integer :lifecycle
      t.string :make
      t.string :model
      t.boolean :is_used
      t.boolean :is_assigned
      t.boolean :is_supported

      t.timestamps null: false
    end
  end
end
