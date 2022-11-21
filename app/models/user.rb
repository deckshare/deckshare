# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
# @!attribute id
#   @return [String]
# @!attribute confirmation_token
#   @return [String]
# @!attribute confirmed_at
#   @return [Time]
# @!attribute email
#   @return [String]
# @!attribute password_digest
#   @return [String]
# @!attribute username
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
#
class User < ApplicationRecord
  has_secure_token :confirmation_token
  has_secure_password

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :username, presence: true, uniqueness: true

  scope :confirmed, -> { where.not(confirmed_at: nil) }

  def confirmed?
    confirmed_at?
  end
end
