class CreatePokemonDeckCards < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_deck_cards, id: :uuid do |t|
      t.references :deck, null: false, foreign_key: true, type: :uuid
      t.references :pokemon_card, null: false, foreign_key: true, type: :uuid
      t.integer :quantity

      t.timestamps
    end

    add_index :pokemon_deck_cards, [:deck_id, :pokemon_card_id], unique: true
  end
end
