# frozen_string_literal: true

class Deck < ApplicationRecord
  DECK_TYPE_POKEMON = :pokemon

  attr_readonly :deck_type

  enum :deck_type, "#{DECK_TYPE_POKEMON}": DECK_TYPE_POKEMON.to_s

  validates :name, presence: true
  validates :deck_type, presence: true

  belongs_to :user

  before_validation :default_name

  private

  def default_name
    self.name ||= "Untitled Deck #{user.decks.count + 1}"
  end
end
