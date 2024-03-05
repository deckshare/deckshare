# frozen_string_literal: true

module Pokemon
  class Deck < ::Deck
    def self.card_type
      Pokemon::Card
    end
  end
end
