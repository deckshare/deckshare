class Pokemon::CardsController < ApplicationController
  def index
    cards = Pokemon::Card.pagy_search(params[:q], fields: Pokemon::Card::DEFAULT_SEARCH_FIELDS) if params.has_key?(:q)
    @pagy, @cards = pagy_searchkick(cards)
  end

  def show
    @card = Pokemon::Card.find_by!(card_id: params[:id])
  end
end
