class Pokemon::CardsController < ApplicationController
  def index
    if params[:q]
      cards = Pokemon::Card.pagy_search(params[:q], fields: Pokemon::Card::DEFAULT_SEARCH_FIELDS)
      @pagy, @cards = pagy_searchkick(cards)
    end
  end

  def show
    @card = Pokemon::Card.find_by!(card_id: params[:id])
  end
end
