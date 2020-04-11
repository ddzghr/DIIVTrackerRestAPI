class CreateDeliveryStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_statuses do |t|
      t.references :delivery, foreign_key: true, null: false
      t.references :status, foreign_key: true, null: false
      t.references :device, foreign_key: true, null: false
      t.datetime :local_datetime, null: false
      t.references :assigned_device,
                   foreign_key: { to_table: :devices },
                   index: true, null: true

      t.timestamps
    end
  end
end
