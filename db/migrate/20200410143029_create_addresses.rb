class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street, limit: 150, null: false
      t.string :city_arrea_or_district, limit: 150
      t.string :city_or_town_or_village, limit: 150, null: false
      t.string :county, limit: 150
      t.string :postal_code_and_name, limit: 150, null: false
      t.string :country, limit: 150
      t.references :addressable, polymorphic: true, index: true, null: true

      t.timestamps
    end
  end
end
