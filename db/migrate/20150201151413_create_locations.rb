class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :country
      t.string :city
      t.string :site_code
      t.text :address

      t.timestamps null: false
    end
  end
end
