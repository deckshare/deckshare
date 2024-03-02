# frozen_string_literal: true

module Pokemon
  class Card
    class Query
      include ActiveModel::API

      attr_accessor :q

      def initialize(query)
        @q = query
      end

      def search
        return if q.blank?

        Pokemon::Card.pagy_search(q, fields: DEFAULT_SEARCH_FIELDS)
      end
    end
  end
end
