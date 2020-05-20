# frozen_string_literal: true

class CreateDeviceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :device_types do |t|
      t.string :code, limit: 10, null: false
      t.string :name, limit: 150, null: false
      t.boolean :internal_api_server_type, default: false, null: false
      t.boolean :internal_web_server_type, default: false, null: false
      t.boolean :desktop_type, default: false, null: false
      t.boolean :web_server_type, default: false, null: false
      t.boolean :mobile_type, default: false, null: false

      t.timestamps
    end
    add_index :device_types, :code, unique: true
    add_index :device_types, %i[internal_api_server_type
                                internal_web_server_type
                                desktop_type web_server_type
                                mobile_type],
              unique: true,
              name: 'device_types_type_uk'
  end
end
