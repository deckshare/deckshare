# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { build(:user) }

  it { is_expected.to be_valid }

  context 'with an invalid email address' do
    before { user.email.sub!('@', '__') }

    it { is_expected.not_to be_valid }
  end

  describe '#cards' do
    subject(:collection) { user }

    let(:collection_card) { create(:user_card, user:, card:, quantity:) }

    it_behaves_like 'a collection of cards'
  end

  describe '#to_s' do
    subject(:_to_s) { user.to_s }

    it { is_expected.to eq(user.username) }
  end
end
