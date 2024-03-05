class CreateDecks < ActiveRecord::Migration[7.1]
  def change
    create_table :decks, id: :uuid do |t|
      t.string :name
      t.string :type, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :decks, :name
    add_index :decks, :type
  end
end
