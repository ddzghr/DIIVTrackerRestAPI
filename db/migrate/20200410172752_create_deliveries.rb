class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :uuid, limit: 36, null: false
      t.string :orderer_email, limit: 254, null: false
      t.string :orderer_name, limit: 150, null: false
      t.decimal :amount_on_delivery, precision: 15, scale: 2
      t.references :orderer, foreign_key: { to_table: :users }, index: true , null: true
      t.references :supplier, foreign_key: { to_table: :users }, index: true , null: false
      t.references :courier, foreign_key: { to_table: :users }, index: true , null: false
      t.text :annotation

      t.timestamps
    end
    add_index :deliveries, :uuid, unique: true
  end
end
