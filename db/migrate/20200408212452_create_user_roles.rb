class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.string :uuid, limit: 36, null: false
      t.references :user, foreign_key: true, null: false
      t.references :role, foreign_key: true, null: false
      t.string :invoice, limit: 36, null: true
      t.date :valid_from, null: true
      t.date :valid_through, null: true

      t.timestamps null: false
    end
  end
end
