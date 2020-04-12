class CreateUserAccountDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :user_account_devices do |t|
      t.references :user_account, foreign_key: true, null: false
      t.references :device, foreign_key: true, null: false
      t.references :account_type_device_type, foreign_key: true, null: false

      t.timestamps
    end
    add_index :user_account_devices, %i[user_account_id device_id],
              unique: true,
              name: 'user_account_devices_uk'
  end
end
