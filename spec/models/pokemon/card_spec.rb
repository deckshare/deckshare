require 'rails_helper'

RSpec.describe Pokemon::Card, type: :model do
  subject(:card) { Pokemon::Card.find_by card_id: }

  let(:card_id) { 'xy1-1' }

  describe '#alternates' do
    subject(:_alternates) { card.alternates.pluck(:card_id) }

    it { is_expected.to contain_exactly('xy1-141') }
  end

  describe '#to_param' do
    subject(:_to_param) { card.to_param }

    it { is_expected.to eq(card_id) }
  end

  describe '#to_s' do
    subject(:_to_s) { card.to_s }

    it { is_expected.to eq("Venusaur-EX - XY 1 / 146") }
  end
end
