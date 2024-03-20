# frozen_string_literal: true

module Pokemon
  class Deck
    class Card < ApplicationRecord
      attr_readonly :deck, :card

      belongs_to :deck
      belongs_to :card, foreign_key: :pokemon_card_id, inverse_of: :deck_cards, class_name: 'Pokemon::Card'

      validates :quantity, numericality: { greater_than: 0 }

      def self.table_name
        'pokemon_deck_cards'
      end
    end
  end
end
