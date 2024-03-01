# frozen_string_literal: true

module Pokemon
  class Set < ApplicationRecord
    extend Pagy::Searchkick

    searchkick

    has_many :cards, foreign_key: 'pokemon_set_id', inverse_of: :set

    def to_param
      set_id
    end
  end
end
