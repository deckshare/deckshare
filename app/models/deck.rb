# frozen_string_literal: true

class Deck < ApplicationRecord
  include Collection

  belongs_to :user

  before_validation :default_name

  validates_associated :cards

  scope :pokemon, -> { where(type: 'Pokemon::Deck') }

  private

  def default_name
    self.name ||= "Untitled Deck #{user.decks.count + 1}"
  end
end
