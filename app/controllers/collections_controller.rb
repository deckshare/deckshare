# frozen_string_literal: true

class CollectionsController < ApplicationController
  include Authentication

  before_action :authenticate_user!

  def show
    @cards = current_user.cards.includes(card: [:set])
  end
end
