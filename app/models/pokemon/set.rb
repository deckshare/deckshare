# frozen_string_literal: true

module Pokemon
  class Set < ApplicationRecord
    include Readonly
    include Searchable

    has_many :cards, foreign_key: 'pokemon_set_id', inverse_of: :set, dependent: :delete_all

    def to_param
      set_id
    end
  end
end
