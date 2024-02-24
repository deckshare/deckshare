class Pokemon::CardsController < ApplicationController
  def index
    fields = %i[name]
    @cards = Pokemon::Card.search(params[:q], fields:) if params.has_key?(:q)
  end

  def show
    @card = Pokemon::Card.find_by!(card_id: params[:id])
  end
end
