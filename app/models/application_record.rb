# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :integer_in_array, ->(column, value)   { where("#{value} = ANY (#{column})") }
  scope :string_in_array,  ->(column, value)   { where("'#{value}' = ANY (#{column})") }
  scope :object_in_array,  ->(column, *values) { where("#{column} @> '[#{values.map(&:to_json).join(',')}]'") }

  class << self
    protected

    def array_agg(column, sort: :asc)
      joins("CROSS JOIN unnest(#{column}) AS elem")
        .pluck(Arel.sql("array_agg(DISTINCT elem ORDER BY elem #{sort.upcase})"))
        .flatten
    end

    def array_elements(column, field)
      joins("CROSS JOIN LATERAL jsonb_array_elements(#{column}) elem")
        .pluck(Arel.sql("DISTINCT elem->'#{field}'"))
    end

    def pluck_distinct(column)
      distinct.order(column).pluck(column)
    end
  end
end
