# frozen_string_literal: true

# Create the users table.
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :confirmation_token
      t.datetime :confirmed_at

      t.timestamps
    end

    add_index :users, :confirmation_token, unique: true
    add_index :users, :confirmed_at, where: 'confirmed_at IS NOT NULL'
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
