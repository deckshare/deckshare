class Pokemon::Card < ApplicationRecord
  attribute :images, Images.to_type
  attribute :attacks, Attack.to_array_type
  attribute :weaknesses, Weakness.to_array_type

  belongs_to :set, foreign_key: "pokemon_set_id", inverse_of: :cards

  class << self
    def regulation_marks
      distinct.order(:regulation_mark).pluck(:regulation_mark)
    end

    def subtypes
      joins('cross join unnest(subtypes) as subtype where subtype is not null')
        .pluck(Arel.sql('array_agg(distinct subtype order by subtype asc)'))
        .flatten
    end

    def supertypes
      distinct.order(:supertype).pluck(:supertype)
    end

    def types
      joins('cross join unnest(types) as ptype where ptype is not null')
        .pluck(Arel.sql('array_agg(distinct ptype order by ptype asc)'))
        .flatten
    end
  end
end
