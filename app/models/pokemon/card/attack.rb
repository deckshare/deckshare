class Pokemon::Card::Attack
  include StoreModel::Model

  attribute :cost, :array_of_strings
  attribute :name, :string
  attribute :text, :string
  attribute :damage, :string
  attribute :converted_energy_cost, :integer

  class << self
    def names
      Pokemon::Card.attack_names
    end
  end
end
