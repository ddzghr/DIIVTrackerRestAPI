class CreateAccountTypeDeviceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :account_type_device_types do |t|
      t.references :account_type, foreign_key: true, null: false
      t.references :device_type, foreign_key: true, null: false
      t.boolean :applicable, default: false, null: false

      t.timestamps
    end
    add_index :account_type_device_types, %i[account_type_id device_type_id],
              unique: true,
              name: 'account_type_device_types_uk'
  end
end
