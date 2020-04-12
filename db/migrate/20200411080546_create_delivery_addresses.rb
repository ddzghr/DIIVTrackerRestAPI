class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.references :delivery, foreign_key: true, null: false
      t.references :address_types, foreign_key: true, null: false

      t.timestamps
    end
  end
end
