class CreateAddressTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :address_types do |t|
      t.string :code, limit: 10, null: false
      t.string :name, limit: 50, null: false

      t.timestamps
    end
    add_index :address_types, :code, unique: true
  end
end
