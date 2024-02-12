class CreateDecksharePokemonCards < ActiveRecord::Migration[7.1]
  def change
    create_table :deckshare_pokemon_cards, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :card_id
      t.integer :quantity

      t.timestamps
    end
    add_index :deckshare_pokemon_cards, [:user_id, :card_id], unique: true
  end
end
