# frozen_string_literal: true

module Deckshare
  module Pokemon
    class Card < ApplicationRecord
      belongs_to :user

      validates :card_id, presence: true
      validates :quantity, numericality: { greater_than: 0 }

      def card
        @card ||= Pokemon::Card.find(card_id)
      end
    end
  end
end
