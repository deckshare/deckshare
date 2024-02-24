class Pokemon::Card::Attack
  include StoreModel::Model

  attribute :cost, :array_of_strings
  attribute :name, :string
  attribute :text, :string
  attribute :damage, :string
  attribute :converted_energy_cost, :integer
end
