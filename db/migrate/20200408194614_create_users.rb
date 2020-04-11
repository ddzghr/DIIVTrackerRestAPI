class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uuid, limit: 36, null: false
      t.string :name, limit: 150, null: false
      t.string :email, limit: 254, null: false
      t.string :password_digest, null: false
      t.string :company_name, limit: 150, null: true
      t.boolean :user_active, default: false, null: false
      t.boolean :user_locked, default: false, null: false
      t.boolean :email_confirmed, default: false, null: false
      t.string :confirm_token, null: false
      t.string :password_reset_token, null: false

      t.timestamps null: false
    end
    add_index :users, :uuid, unique: true
    add_index :users, :email, unique: true
    add_index :users, :confirm_token, unique: true
    add_index :users, :password_reset_token, unique: true
  end
end
