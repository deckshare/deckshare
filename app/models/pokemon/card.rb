class Pokemon::Card < ApplicationRecord
  DEFAULT_SEARCH_FIELDS = %i[name types subtypes abilities.name attacks.name].freeze

  searchkick

  attribute :abilities, Ability.to_array_type
  attribute :attacks, Attack.to_array_type
  attribute :images, Images.to_type
  attribute :weaknesses, Weakness.to_array_type

  belongs_to :set, foreign_key: "pokemon_set_id", inverse_of: :cards

  scope :evolves_to,       ->(name)   { string_in_array(name, :evolves_to) }
  scope :has_ability_name, ->(name)   { object_in_array({ name: }, :abilities) }
  scope :has_attack_name,  ->(name)   { object_in_array({ name: }, :attacks) }
  scope :has_dex_number,   ->(number) { integer_in_array(number, :national_pokedex_numbers) }
  scope :has_subtype,      ->(name)   { string_in_array(name, :subtypes) }
  scope :has_type,         ->(name)   { string_in_array(name, :types) }
  scope :has_weakness,     ->(type)   { object_in_array({ type: }, :weaknesses) }

  class << self
    def regulation_marks
      pluck_distinct(:regulation_mark)
    end

    def subtypes
      array_agg(:subtypes)
    end

    def supertypes
      pluck_distinct(:supertype)
    end

    def types
      array_agg(:types)
    end
  end

  def to_param
    card_id
  end

  def alternates
    Card.where(name:, set_id:).excluding(self)
  end
end
