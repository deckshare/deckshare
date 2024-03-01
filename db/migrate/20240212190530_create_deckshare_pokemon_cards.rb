# frozen_string_literal: true

class CreateDecksharePokemonCards < ActiveRecord::Migration[7.1]
  def change
    create_table :deckshare_pokemon_cards, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :card_id
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
    add_index :deckshare_pokemon_cards, %i[user_id card_id], unique: true
  end
end
