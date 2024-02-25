class Pokemon::CardsController < ApplicationController
  def index
    @cards = Pokemon::Card.search(params[:q], fields: Pokemon::Card::DEFAULT_SEARCH_FIELDS) if params.has_key?(:q)
  end

  def show
    @card = Pokemon::Card.find_by!(card_id: params[:id])
  end
end
