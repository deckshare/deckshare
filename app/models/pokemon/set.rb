class Pokemon::Set < ApplicationRecord
  has_many :cards, foreign_key: "pokemon_set_id", inverse_of: :set
end
