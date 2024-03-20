# frozen_string_literal: true

module Pokemon
  class Deck < ::Deck
    has_many :cards, dependent: :destroy_async, class_name: 'Pokemon::Deck::Card',
                     extend: HasManyCards
  end
end
