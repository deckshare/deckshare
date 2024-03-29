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
      before { collection_card }

      it { expect { add! }.to change { cards.reload.find_by(card:).quantity }.from(1).to(2) }
    end

    context 'with an invalid quantity' do
      let(:quantity) { 0 }

      it { expect { add! }.to raise_error(RangeError, '0 not greater than 0') }
    end
  end

  describe '.remove!' do
    subject(:remove!) { cards.reload.remove!(card_to_remove, quantity: qty_to_remove) }

    let(:card) { Pokemon::Card.find_by(card_id: 'sv4pt5-59') }
    let(:card_to_remove) { card }

    let(:quantity) { 2 }
    let(:qty_to_remove) { 1 }

    before { collection_card }

    context 'with a quantity between 1 and card.quantity' do
      it { expect { remove! }.to change { cards.reload.find_by(card:).quantity }.from(2).to(1) }
    end

    context 'with a quantity equal to card.quantity and greater than 1' do
      let(:qty_to_remove) { 2 }

      it { expect { remove! }.to change { cards.reload.exists?(card:) }.from(true).to(false) }
    end

    context 'with a quantity and card.quantity equal to 1' do
      let(:quantity) { 1 }

      it { expect { remove! }.to change { cards.reload.exists?(card:) }.from(true).to(false) }
    end

    context 'with a quantity greater than card.quantity' do
      let(:qty_to_remove) { 3 }

      it { expect { remove! }.to raise_error(RangeError, '3 not in range 1..2') }
    end

    context 'with a quantity of 0' do
      let(:qty_to_remove) { 0 }

      it { expect { remove! }.to raise_error(RangeError, '0 not in range 1..2') }
    end

    context 'with an unowned card' do
      let(:card_to_remove) { Pokemon::Card.find_by(card_id: 'sv4pt5-231') }

      it { expect { remove! }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
