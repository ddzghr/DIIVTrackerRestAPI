class CreateGpsLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :gps_locations do |t|
      t.float :gps_latitude, null: false
      t.float :gps_longitude, null: false
      t.references :locatable, polymorphic: true, index: true, null: false

      t.timestamps
    end
  end
end
