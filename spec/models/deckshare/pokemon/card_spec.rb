require 'rails_helper'

RSpec.describe Deckshare::Pokemon::Card, type: :model do
  subject(:card) { FactoryBot.build(:deckshare_pokemon_card) }

  it { is_expected.to be_valid }

  context "without a card ID" do
    before { card.card_id = nil }

    it { is_expected.not_to be_valid }
  end

  context "without a quantity" do
    before { card.quantity = nil }

    it { is_expected.not_to be_valid }
  end

  context "with an invalid quantity" do
    before { card.quantity = 0 }

    it { is_expected.not_to be_valid }
  end
end
