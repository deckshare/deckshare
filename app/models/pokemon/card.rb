# frozen_string_literal: true

module Pokemon
  class Card < ApplicationRecord
    extend Pagy::Searchkick

    DEFAULT_SEARCH_FIELDS = %i[
      name
      supertype
      subtypes
      types
      evolves_from
      evolves_to
      rules
      ancient_trait
      abilities.name
      abilities.text
      attacks.name
      attacks.text
      legalities
      artist
      rarity
      set.name
      set.series
      set.legalities
      set.ptcgo_code
    ].freeze

    searchkick

    attribute :abilities, Ability.to_array_type
    attribute :attacks, Attack.to_array_type
    attribute :images, Images.to_type
    attribute :weaknesses, Weakness.to_array_type

    belongs_to :set, foreign_key: 'pokemon_set_id', inverse_of: :cards

    has_many :user_cards, as: :card, class_name: 'User::Card', dependent: :delete_all
    has_many :users, through: :user_cards

    default_scope -> { readonly.includes(:set) }

    scope :evolves_to,       ->(name)   { string_in_array(name, :evolves_to) }
    scope :has_ability_name, ->(name)   { object_in_array({ name: }, :abilities) }
    scope :has_attack_name,  ->(name)   { object_in_array({ name: }, :attacks) }
    scope :has_dex_number,   ->(number) { integer_in_array(number, :national_pokedex_numbers) }
    scope :has_subtype,      ->(name)   { string_in_array(name, :subtypes) }
    scope :has_type,         ->(name)   { string_in_array(name, :types) }
    scope :has_weakness,     ->(type)   { object_in_array({ type: }, :weaknesses) }

    class << self
      def ability_names
        array_elements(:abilities, :name)
      end

      def attack_names
        array_elements(:attacks, :name)
      end

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

    def alternates
      set.cards.where(name:).excluding(self)
    end

    def search_data
      attributes.merge(set:)
    end

    def to_param
      card_id
    end

    def to_s
      "#{name} - #{set.name} #{number} / #{set.printed_total}"
    end
  end
end
