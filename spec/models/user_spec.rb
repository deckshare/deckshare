# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { build(:user) }

  it { is_expected.to be_valid }

  context 'with an invalid email address' do
    before { user.email.sub!('@', '__') }

    it { is_expected.not_to be_valid }
  end

  describe '#add_card!' do
    subject(:add_card!) { user.add_card!(card:, quantity:) }

    let(:card) { Pokemon::Card.find_by(card_id: 'sv4pt5-59') }
    let(:quantity) { 1 }

    context 'with a new card' do
      it { expect { add_card! }.to change { user.cards.exists?(card:) }.from(false).to(true) }
      it { expect { add_card! }.to change { user.cards.find_by(card:)&.quantity }.from(nil).to(1) }
    end

    context 'with an existing card' do
      before { create(:user_card, user:, card:, quantity:) }

      it { expect { add_card! }.to change { user.cards.find_by(card:).quantity }.from(1).to(2) }
    end

    context 'with an invalid quantity' do
      let(:quantity) { 0 }

      it { expect { add_card! }.to raise_error(RangeError, '0 not greater than 0') }
    end
  end

  describe '#remove_card!' do
    subject(:remove_card!) { user.remove_card!(card:, quantity:) }

    let(:card) { owned_card }
    let(:owned_card) { Pokemon::Card.find_by(card_id: 'sv4pt5-59') }

    let(:initial_quantity) { 2 }
    let(:quantity) { 1 }

    before { create(:user_card, user:, card: owned_card, quantity: initial_quantity) }

    context 'with a quantity between 1 and card.quantity' do
      it { expect { remove_card! }.to change { user.cards.find_by(card:).quantity }.from(2).to(1) }
    end

    context 'with a quantity equal to card.quantity and greater than 1' do
      let(:quantity) { 2 }

      it { expect { remove_card! }.to change { user.cards.exists?(card:) }.from(true).to(false) }
    end

    context 'with a quantity and card.quantity equal to 1' do
      let(:initial_quantity) { 1 }

      it { expect { remove_card! }.to change { user.cards.exists?(card:) }.from(true).to(false) }
    end

    context 'with a quantity greater than card.quantity' do
      let(:quantity) { 3 }

      it { expect { remove_card! }.to raise_error(RangeError, '3 not in range 1..2') }
    end

    context 'with a quantity of 0' do
      let(:quantity) { 0 }

      it { expect { remove_card! }.to raise_error(RangeError, '0 not in range 1..2') }
    end

    context 'with an unowned card' do
      let(:card) { Pokemon::Card.find_by(card_id: 'sv4pt5-231') }

      it { expect { remove_card! }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
