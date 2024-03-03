# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token :confirmation_token
  has_secure_password

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :cards, dependent: :destroy_async
  has_many :pokemon_cards, through: :cards, source: :card, source_type: 'Pokemon::Card'

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

  def add_card!(card:, quantity: 1)
    raise RangeError, "#{quantity} not greater than 0" unless quantity.positive?

    card = cards.find_or_initialize_by(card:)
    card.quantity += quantity
    card.save!
  end

  def remove_card!(card:, quantity: 1)
    card = cards.find_by!(card:)

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

  def to_s
    username
  end
end
