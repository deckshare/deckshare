# frozen_string_literal: true

module Pokemon
  class Card
    class Weakness
      include StoreModel::Model

      attribute :type, :string
      attribute :value, :string
    end
  end
end
