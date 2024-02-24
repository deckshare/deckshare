class Pokemon::Card::Weakness
  include StoreModel::Model

  attribute :type, :string
  attribute :value, :string
end
