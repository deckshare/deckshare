# frozen_string_literal: true

module Pokemon
  class CardsController < ApplicationController
    def index
      @query = Card::Query.new(params[:q])

      cards = @query.search

      return unless cards

      @pagy, @cards = pagy_searchkick(cards)
    end

    def show
      @card = Card.find_by!(card_id: params[:id])
    end
  end
end
