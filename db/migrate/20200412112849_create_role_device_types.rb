class CreateRoleDeviceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :role_device_types do |t|
      t.references :role, foreign_key: true, null: false
      t.references :device_type, foreign_key: true, null: false
      t.boolean :applicable, default: false, null: false

      t.timestamps
    end
    add_index :role_device_types, %i[role_id device_type_id],
              unique: true,
              name: 'role_device_types_uk'
  end
end
