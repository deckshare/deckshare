# frozen_string_literal: true

module Pokemon
  class Card
    class Images
      include StoreModel::Model

      attribute :large, :string
      attribute :small, :string
    end
  end
end
