class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, limit: 150
      t.string :phone, limit: 50
      t.references :contactable, polymorphic: true

      t.timestamps
    end
  end
end
