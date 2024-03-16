# frozen_string_literal: true

class CollectionsController < ApplicationController
  include Authentication

  def show
    @cards = current_user.cards.includes(card: [:set])
  end
end
