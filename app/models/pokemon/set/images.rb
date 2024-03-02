# frozen_string_literal: true

module Pokemon
  class Set
    class Images
      include StoreModel::Model

      attribute :logo, :string
      attribute :symbol, :string
    end
  end
end
