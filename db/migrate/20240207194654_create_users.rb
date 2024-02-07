class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :confirmation_token
      t.datetime :confirmed_at

      t.timestamps
    end
    add_index :users, :confirmation_token, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
