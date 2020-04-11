class CreateWorkflows < ActiveRecord::Migration[5.2]
  def change
    create_table :workflows do |t|
      t.references :old_status,
                   foreign_key: { to_table: :statuses },
                   index: true , null: false
      t.references :new_status,
                   foreign_key: { to_table: :statuses },
                   index: true , null: false
      t.references :device_type, foreign_key: true, null: false

      t.timestamps
    end
    add_index :workflows, %i[old_status_id
                             new_status_id
                             device_type_id],
              unique: true,
              name: 'workflow_uk'
  end
end
