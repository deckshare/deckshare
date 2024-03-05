# frozen_string_literal: true

class Deck < ApplicationRecord
  belongs_to :user

  has_many :cards, as: :collection, dependent: :destroy_async

  before_validation :default_name

  validates_associated :cards

  scope :pokemon, -> { where(type: 'Pokemon::Deck') }

  private

  def default_name
    self.name ||= "Untitled Deck #{user.decks.count + 1}"
  end
end
