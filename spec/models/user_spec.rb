# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { build(:user) }

  it { is_expected.to be_valid }

  context 'with an invalid email address' do
    before { user.email.sub!('@', '__') }

    it { is_expected.not_to be_valid }
  end

  # describe '#add_pokemon_card!' do
  #   subject(:add_pokemon_card!) { user.add_pokemon_card!(card_id:, quantity:) }

  #   let(:card_id) { 'xy1-1' }
  #   let(:quantity) { 1 }

  #   context 'with a new card id' do
  #     it { expect { add_pokemon_card! }.to change { user.pokemon_cards.where(card_id:).count }.from(0).to(1) }
  #     it { expect { add_pokemon_card! }.to change { user.pokemon_cards.find_by(card_id:)&.quantity }.from(nil).to(1) }
  #   end

  #   context 'with an existing card id' do
  #     before { create(:deckshare_pokemon_card, user:, card_id:) }

  #     it { expect { add_pokemon_card! }.to change { user.pokemon_cards.find_by(card_id:).quantity }.from(1).to(2) }
  #   end

  #   context 'with an invalid quantity' do
  #     let(:quantity) { 0 }

  #     it { expect { add_pokemon_card! }.to raise_error(RangeError, "#{quantity} not greater than 0") }
  #   end
  # end

  # describe '#remove_pokemon_card!' do
  #   subject(:remove_pokemon_card!) { user.remove_pokemon_card!(card_id:, quantity:) }

  #   let(:card_id) { 'xy1-1' }
  #   let(:initial_quantity) { 2 }
  #   let(:quantity) { 1 }

  #   before { create(:deckshare_pokemon_card, user:, quantity: initial_quantity) }

  #   context 'with a quantity between 1 and card.quantity' do
  #     it {
  #       expect { remove_pokemon_card! }.to change {
  #                                            user.pokemon_cards.find_by(card_id:).quantity
  #                                          }.from(initial_quantity).to(initial_quantity - quantity)
  #     }
  #   end

  #   context 'with an quantity and a card.quantity of 1' do
  #     let(:initial_quantity) { 1 }

  #     it { expect { remove_pokemon_card! }.to change { user.pokemon_cards.where(card_id:).count }.from(1).to(0) }
  #   end

  #   context 'with a quantity equal to card.quantity' do
  #     let(:quantity) { initial_quantity }

  #     it { expect { remove_pokemon_card! }.to change { user.pokemon_cards.where(card_id:).count }.from(1).to(0) }
  #   end

  #   context 'with a quantity greater than card.quantity' do
  #     let(:quantity) { initial_quantity + 1 }

  #     it {
  #       expect do
  #         remove_pokemon_card!
  #       end.to raise_error(RangeError, "#{initial_quantity + 1} not in range 1..#{initial_quantity}")
  #     }
  #   end

  #   context 'with a quantity of 0' do
  #     let(:quantity) { 0 }

  #     it {
  #       expect do
  #         remove_pokemon_card!
  #       end.to raise_error(RangeError, "#{quantity} not in range 1..#{initial_quantity}")
  #     }
  #   end
  # end
end
