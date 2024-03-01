# frozen_string_literal: true

module Pokemon
  class CardsController < ApplicationController
    def index
      return unless params[:q]

      cards = Pokemon::Card.pagy_search(params[:q], fields: Pokemon::Card::DEFAULT_SEARCH_FIELDS)
      @pagy, @cards = pagy_searchkick(cards)
    end

    def show
      @card = Pokemon::Card.find_by!(card_id: params[:id])
    end
  end
end
