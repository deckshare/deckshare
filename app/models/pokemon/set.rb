# frozen_string_literal: true

module Pokemon
  class Set < ApplicationRecord
    include Readonly
    include Searchable

    attribute :images, Images.to_type
    attribute :legalities, Legalities.to_type

    has_many :cards, foreign_key: 'pokemon_set_id', inverse_of: :set, dependent: :delete_all

    def to_param
      set_id
    end
  end
end
