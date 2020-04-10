class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :uuid, limit: 36, null: false
      t.string :name, limit: 150, null: false
      t.references :user, foreign_key: true, null: false
      t.references :device_type, foreign_key: true, null: false
      t.boolean :device_active, default: false
      t.boolean :device_locked, default: false
      t.boolean :device_confirmed, default: false
      t.string :confirm_token, null: false

      t.timestamps null: false
    end
    add_index :devices, :uuid, unique: true
    add_index :devices, :confirm_token, unique: true
  end
end
