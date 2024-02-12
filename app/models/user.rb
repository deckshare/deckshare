class User < ApplicationRecord
  has_secure_token :confirmation_token
  has_secure_password

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :pokemon_cards, class_name: "Deckshare::Pokemon::Card"

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
end
