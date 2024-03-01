# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token :confirmation_token
  has_secure_password

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :pokemon_cards, class_name: 'Deckshare::Pokemon::Card'

  class << self
    def find_and_authenticate_by!(email:, password:)
      find_by!(email:).authenticate!(password)
    rescue ActiveRecord::RecordNotFound
      raise Deckshare::Errors::AuthenticationError
    end
  end

  def authenticate!(password)
    authenticate(password) or raise Deckshare::Errors::AuthenticationError
  end

  def add_pokemon_card!(card_id:, quantity: 1)
    raise RangeError, "#{quantity} not greater than 0" unless quantity.positive?

    card = pokemon_cards.find_or_initialize_by(card_id:)
    card.quantity += quantity
    card.save!
  end

  def remove_pokemon_card!(card_id:, quantity: 1)
    card = pokemon_cards.find_by!(card_id:)

    case quantity
    when card.quantity
      card.destroy!
    when 1...card.quantity
      card.quantity -= quantity
      card.save!
    else
      raise RangeError, "#{quantity} not in range 1..#{card.quantity}"
    end
  end
end
