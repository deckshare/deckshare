# frozen_string_literal: true

RSpec.shared_examples 'a collection of cards' do
  subject(:cards) { collection.cards }

  let(:card) { Pokemon::Card.find_by(card_id: 'sv4pt5-59') }
  let(:quantity) { 1 }

  describe '.add!' do
    subject(:add!) { cards.reload.add!(card, quantity:) }

    context 'with a new card' do
      it { expect { add! }.to change { cards.reload.exists?(card:) }.from(false).to(true) }
      it { expect { add! }.to change { cards.reload.find_by(card:)&.quantity }.from(nil).to(1) }
    end

    context 'with an existing card' do
      before { create(:card, collection:, card:, quantity:) }

      it { expect { add! }.to change { cards.reload.find_by(card:).quantity }.from(1).to(2) }
    end

    context 'with an invalid quantity' do
      let(:quantity) { 0 }

      it { expect { add! }.to raise_error(RangeError, '0 not greater than 0') }
    end
  end

  describe '.remove!' do
    subject(:remove!) { cards.reload.remove!(card, quantity:) }

    let(:card) { owned_card }
    let(:owned_card) { Pokemon::Card.find_by(card_id: 'sv4pt5-59') }

    let(:initial_quantity) { 2 }
    let(:quantity) { 1 }

    before { create(:card, collection:, card: owned_card, quantity: initial_quantity) }

    context 'with a quantity between 1 and card.quantity' do
      it { expect { remove! }.to change { cards.reload.find_by(card:).quantity }.from(2).to(1) }
    end

    context 'with a quantity equal to card.quantity and greater than 1' do
      let(:quantity) { 2 }

      it { expect { remove! }.to change { cards.reload.exists?(card:) }.from(true).to(false) }
    end

    context 'with a quantity and card.quantity equal to 1' do
      let(:initial_quantity) { 1 }

      it { expect { remove! }.to change { cards.reload.exists?(card:) }.from(true).to(false) }
    end

    context 'with a quantity greater than card.quantity' do
      let(:quantity) { 3 }

      it { expect { remove! }.to raise_error(RangeError, '3 not in range 1..2') }
    end

    context 'with a quantity of 0' do
      let(:quantity) { 0 }

      it { expect { remove! }.to raise_error(RangeError, '0 not in range 1..2') }
    end

    context 'with an unowned card' do
      let(:card) { Pokemon::Card.find_by(card_id: 'sv4pt5-231') }

      it { expect { remove! }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
