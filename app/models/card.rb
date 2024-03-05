# frozen_string_literal: true

class Card < ApplicationRecord
  attr_readonly :card, :collection

  belongs_to :card, polymorphic: true
  belongs_to :collection, polymorphic: true

  validates :card_type, inclusion: { in: %w[Pokemon::Card] }
  validates :quantity, numericality: { greater_than: 0 }

  validate :card_collection_type_match

  scope :pokemon, -> { where(card_type: 'Pokemon::Card') }

  private

  def card_collection_type_match
    return if collection.is_a?(User)
    return if card.is_a?(collection.class.card_type)

    errors.add(:card, 'mismatched card type for collection type')
  end
end
