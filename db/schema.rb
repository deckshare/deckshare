# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_04_212054) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "decks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "type", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_decks_on_name"
    t.index ["type"], name: "index_decks_on_type"
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "pokemon_cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "card_id"
    t.string "name"
    t.string "supertype"
    t.string "subtypes", array: true
    t.string "level"
    t.string "hp"
    t.string "types", array: true
    t.string "evolves_from"
    t.string "evolves_to", array: true
    t.string "rules", array: true
    t.jsonb "ancient_trait"
    t.jsonb "abilities"
    t.jsonb "attacks"
    t.jsonb "weaknesses"
    t.jsonb "resistances"
    t.string "retreat_cost", array: true
    t.integer "converted_retreat_cost"
    t.uuid "pokemon_set_id", null: false
    t.string "number"
    t.string "artist"
    t.string "rarity"
    t.string "flavor_text"
    t.integer "national_pokedex_numbers", array: true
    t.jsonb "legalities"
    t.string "regulation_mark"
    t.jsonb "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_pokemon_cards_on_card_id", unique: true
    t.index ["evolves_to"], name: "index_pokemon_cards_on_evolves_to", using: :gin
    t.index ["name"], name: "index_pokemon_cards_on_name"
    t.index ["national_pokedex_numbers"], name: "index_pokemon_cards_on_national_pokedex_numbers", using: :gin
    t.index ["pokemon_set_id"], name: "index_pokemon_cards_on_pokemon_set_id"
    t.index ["retreat_cost"], name: "index_pokemon_cards_on_retreat_cost", using: :gin
    t.index ["rules"], name: "index_pokemon_cards_on_rules", using: :gin
    t.index ["subtypes"], name: "index_pokemon_cards_on_subtypes", using: :gin
    t.index ["types"], name: "index_pokemon_cards_on_types", using: :gin
  end

  create_table "pokemon_sets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "set_id"
    t.string "name"
    t.string "series"
    t.integer "printed_total"
    t.integer "total"
    t.jsonb "legalities"
    t.string "ptcgo_code"
    t.date "release_date"
    t.jsonb "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["set_id"], name: "index_pokemon_sets_on_set_id", unique: true
  end

  create_table "user_cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "card_type", null: false
    t.uuid "card_id", null: false
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_type", "card_id"], name: "index_user_cards_on_card"
    t.index ["user_id", "card_type", "card_id"], name: "index_user_cards_on_user_id_and_card_type_and_card_id", unique: true
    t.index ["user_id"], name: "index_user_cards_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "decks", "users"
  add_foreign_key "pokemon_cards", "pokemon_sets"
  add_foreign_key "user_cards", "users"
end
