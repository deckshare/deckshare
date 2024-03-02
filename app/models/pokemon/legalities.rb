# frozen_string_literal: true

module Pokemon
  class Legalities
    include StoreModel::Model

    LEGAL = :Legal
    NOT_LEGAL = :'Not Legal'
    BANNED = :Banned
    LEGALITY_VALUES = [NOT_LEGAL, LEGAL, BANNED].freeze

    enum :expanded, LEGALITY_VALUES, default: NOT_LEGAL
    enum :standard, LEGALITY_VALUES, default: NOT_LEGAL
    enum :unlimited, LEGALITY_VALUES, default: NOT_LEGAL
  end
end
