# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deck do
  subject(:deck) { build(:deck) }

  it { is_expected.to be_valid }

  context 'without a name' do
    before do
      deck.name = nil
      deck.valid?
    end

    it { is_expected.to be_valid }
    it { is_expected.to have_attributes(name: 'Untitled Deck 1') }
  end

  context 'without a deck type' do
    before { deck.deck_type = nil }

    it { is_expected.not_to be_valid }
  end
end
