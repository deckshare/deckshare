# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token :confirmation_token
  has_secure_password

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :cards, dependent: :destroy_async, extend: HasManyCards
  has_many :decks, dependent: :destroy_async

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

  def to_s
    username
  end
end
