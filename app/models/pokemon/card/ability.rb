class Pokemon::Card::Ability
  include StoreModel::Model

  attribute :name, :string
  attribute :text, :string
  attribute :type, :string

  class << self
    def names
      Pokemon::Card.ability_names
    end
  end
end
