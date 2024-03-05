# frozen_string_literal: true

module Pokemon
  class Card < ApplicationRecord
    include Readonly
    include Searchable

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

    attribute :abilities, Ability.to_array_type
    attribute :attacks, Attack.to_array_type
    attribute :images, Images.to_type
    attribute :legalities, Legalities.to_type
    attribute :weaknesses, Weakness.to_array_type

    belongs_to :set, foreign_key: 'pokemon_set_id', inverse_of: :cards

    has_many :user_cards, as: :card, class_name: 'User::Card', dependent: :delete_all
    has_many :users, through: :user_cards

    scope :evolves_to,        ->(name)   { string_in_array(:evolves_to, name) }
    scope :has_ability_names, ->(*names) { object_in_array(:abilities, *names.map { |name| { name: } }) }
    scope :has_attack_names,  ->(*names) { object_in_array(:attacks, *names.map { |name| { name: } }) }
    scope :has_dex_number,    ->(number) { integer_in_array(:national_pokedex_numbers, number) }
    scope :has_subtype,       ->(name)   { string_in_array(:subtypes, name) }
    scope :has_type,          ->(name)   { string_in_array(:types, name) }
    scope :has_weakness,      ->(type)   { object_in_array(:weaknesses, { type: }) }

    scope :search_import, -> { includes(:set) }

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

    def alternates # rubocop:disable Metrics/AbcSize
      query = Pokemon::Card.where(name:, supertype:, subtypes:, hp:, types:)

      query = query.has_attack_names(*attacks.map(&:name)) if attacks.present?
      query = query.has_ability_names(*abilities.map(&:name)) if abilities.present?

      query.excluding(self)
    end

    def search_data
      attributes.merge(set:)
    end

    def similar_cards
      similar(fields: DEFAULT_SEARCH_FIELDS)
    end

    def to_param
      card_id
    end

    def to_s
      "#{name} - #{set.name} #{number} / #{set.printed_total}"
    end
  end
end
