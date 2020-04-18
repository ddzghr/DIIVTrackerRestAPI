class CreateRoleTypeDeviceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :role_type_device_types do |t|
      t.references :role_type, foreign_key: true, null: false
      t.references :device_type, foreign_key: true, null: false
      t.boolean :applicable, default: false, null: false

      t.timestamps
    end
    add_index :role_type_device_types, %i[role_type_id device_type_id],
              unique: true,
              name: 'role_type_device_types_uk'
  end
end
