# frozen_string_literal: true

class User
  class Card < ApplicationRecord
    belongs_to :user
    belongs_to :card, polymorphic: true
  end
end
