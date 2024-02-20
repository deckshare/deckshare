class Pokemon::CardsController < ApplicationController
  skip_before_action :current_user

  def index
    @cards = Pokemon::Card.where(q: params[:q]) if params.has_key?(:q)
  end

  def show
    @card = Pokemon::Card.find(params[:id])
  rescue ArgumentError
    redirect_to action: :index, status: :not_found
  end
end
