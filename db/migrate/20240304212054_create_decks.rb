class CreateDecks < ActiveRecord::Migration[7.1]
  def change
    create_table :decks, id: :uuid do |t|
      t.string :name
      t.string :deck_type
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :decks, :name
    add_index :decks, :deck_type
  end
end
