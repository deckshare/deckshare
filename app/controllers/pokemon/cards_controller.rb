class Pokemon::CardsController < ApplicationController
  def index
    @cards = Pokemon::Card.where(q: params[:q]) if params.has_key?(:q)
  end

  def show
    @card = Pokemon::Card.find_by!(card_id: params[:id])
  end
end
