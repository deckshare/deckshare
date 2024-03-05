# frozen_string_literal: true

class Card < ApplicationRecord
  attr_readonly :card, :collection

  belongs_to :card, polymorphic: true
  belongs_to :collection, polymorphic: true

  validates :card_type, inclusion: { in: %w[Pokemon::Card] }
  validates :quantity, numericality: { greater_than: 0 }

  validate :card_collection_type_match

  private

  def card_collection_type_match
    return if collection.is_a?(User)
    return if collection.class.module_parent_name == card.class.module_parent_name

    errors.add(:card,
               'mismatched card type for collection type')
  end
end
