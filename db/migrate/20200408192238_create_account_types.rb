class CreateAccountTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :account_types do |t|
      t.string :code, limit: 10, null: false
      t.string :name, limit: 150, null: false
      t.boolean :internal_admin_type, default: false
      t.boolean :internal_application_type, default: false
      t.boolean :ordering_party_type, default: false
      t.boolean :courier_type, default: false
      t.boolean :supplier_type, default: false
      t.boolean :has_duration, default: false
      t.boolean :has_invoice, default: false

      t.timestamps null: false
    end
    add_index :account_types, :code, unique: true
  end
end
