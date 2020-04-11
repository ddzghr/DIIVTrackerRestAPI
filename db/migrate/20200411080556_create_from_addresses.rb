class CreateFromAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :from_addresses do |t|
      t.references :delivery,null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
