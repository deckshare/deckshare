class CreatePokemonCards < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_cards, id: :uuid do |t|
      t.string :card_id
      t.string :name
      t.string :supertype
      t.string :subtypes, array: true
      t.string :level
      t.string :hp
      t.string :types, array: true
      t.string :evolves_from
      t.string :evolves_to, array: true
      t.string :rules, array: true
      t.jsonb :ancient_trait
      t.jsonb :abilities
      t.jsonb :attacks
      t.jsonb :weaknesses
      t.jsonb :resistances
      t.string :retreat_cost, array: true
      t.integer :converted_retreat_cost
      t.references :pokemon_set, null: false, foreign_key: true, type: :uuid
      t.string :number
      t.string :artist
      t.string :rarity
      t.string :flavor_text
      t.integer :national_pokedex_numbers, array: true
      t.jsonb :legalities
      t.string :regulation_mark
      t.jsonb :images

      t.timestamps
    end
    add_index :pokemon_cards, :card_id, unique: true
    add_index :pokemon_cards, :name
    add_index :pokemon_cards, :subtypes, using: 'gin'
    add_index :pokemon_cards, :types, using: 'gin'
    add_index :pokemon_cards, :evolves_to, using: 'gin'
    add_index :pokemon_cards, :rules, using: 'gin'
    add_index :pokemon_cards, :retreat_cost, using: 'gin'
    add_index :pokemon_cards, :national_pokedex_numbers, using: 'gin'
  end
end
