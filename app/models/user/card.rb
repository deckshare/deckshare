# frozen_string_literal: true

class User
  class Card < ApplicationRecord
    attr_readonly :user, :card

    belongs_to :user
    belongs_to :card, polymorphic: true

    validates :card_type, inclusion: { in: %w[Pokemon::Card] }
    validates :quantity, numericality: { greater_than: 0 }

    scope :pokemon, -> { where(card_type: 'Pokemon::Card') }
  end
end
