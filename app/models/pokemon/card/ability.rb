class Pokemon::Card::Ability
  include StoreModel::Model

  attribute :name, :string
  attribute :text, :string
  attribute :type, :string
end
