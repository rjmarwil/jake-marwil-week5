class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :zipcode
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
