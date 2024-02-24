class Pokemon::Card < ApplicationRecord
  belongs_to :set, foreign_key: "pokemon_set_id", inverse_of: :cards
end
