class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :code, limit: 10, null: false
      t.string :name, limit: 50, null: false
      t.boolean :new_type_status, default: false, null: false
      t.boolean :in_progress_type_status, default: false, null: false
      t.boolean :stored_type_status, default: false, null: false
      t.boolean :delivered_type_status, default: false, null: false
      t.references :status, foreign_key: true

      t.timestamps
    end
    add_index :statuses, :code, unique: true
  end
end
