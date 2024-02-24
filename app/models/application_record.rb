class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :integer_in_array, ->(value, column) { where("#{value} = any(#{column})") }
  scope :string_in_array,  ->(value, column) { where("'#{value}' = any(#{column})") }
  scope :object_in_array,  ->(value, column) { where("#{column} @> '[#{value.to_json}]'") }

  class << self
    protected

    def array_agg(column, sort: :asc)
      joins("CROSS JOIN unnest(#{column}) AS result WHERE result IS NOT NULL")
        .pluck(Arel.sql("array_agg(DISTINCT result ORDER BY result #{sort.upcase})"))
        .flatten
    end

    def pluck_distinct(column)
      distinct.order(column).pluck(column)
    end
  end
end
