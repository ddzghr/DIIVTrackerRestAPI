# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :code, limit: 10, null: false
      t.string :name, limit: 150, null: false
      t.boolean :internal_admin_type, default: false, null: false
      t.boolean :internal_application_type, default: false, null: false
      t.boolean :ordering_party_type, default: false, null: false
      t.boolean :courier_type, default: false, null: false
      t.boolean :supplier_type, default: false, null: false
      t.boolean :has_duration, default: false, null: false
      t.boolean :has_invoice, default: false, null: false

      t.timestamps null: false
    end
    add_index :roles, :code, unique: true
    add_index :roles, %i[internal_admin_type
                         internal_application_type
                         ordering_party_type
                         courier_type
                         supplier_type],
              unique: true,
              name: 'roles_type_uk'
  end
end
