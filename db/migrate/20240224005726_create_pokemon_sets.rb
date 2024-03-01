# frozen_string_literal: true

class CreatePokemonSets < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_sets, id: :uuid do |t|
      t.string :set_id
      t.string :name
      t.string :series
      t.integer :printed_total
      t.integer :total
      t.jsonb :legalities
      t.string :ptcgo_code
      t.date :release_date
      t.jsonb :images

      t.timestamps
    end
    add_index :pokemon_sets, :set_id, unique: true
  end
end
