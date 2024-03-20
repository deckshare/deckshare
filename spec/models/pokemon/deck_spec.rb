# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pokemon::Deck do
  subject(:deck) { build(:pokemon_deck) }

  it { is_expected.to be_valid }

  context 'without a name' do
    before do
      deck.name = nil
      deck.valid?
    end

    it { is_expected.to be_valid }
    it { is_expected.to have_attributes(name: 'Untitled Deck 1') }
  end

  describe '#cards' do
    subject(:collection) { deck }

    let(:collection_card) { create(:pokemon_deck_card, deck:, card:, quantity:) }

    it_behaves_like 'a collection of cards'
  end
end
