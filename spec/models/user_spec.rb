# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { build(:user) }

  it { is_expected.to be_valid }

  context 'with duplicate email' do
    before { create(:user, email: user.email.upcase) }

    it { is_expected.not_to be_valid }
  end

  context 'with invalid email' do
    before { user.email.delete! '@' }

    it { is_expected.not_to be_valid }
  end

  context 'without email' do
    before { user.email = nil }

    it { is_expected.not_to be_valid }
  end

  context 'with duplicate username' do
    before { create(:user, username: user.username) }

    it { is_expected.not_to be_valid }
  end

  context 'without username' do
    before { user.username = nil }

    it { is_expected.not_to be_valid }
  end

  context 'with confirmed_at' do
    before { user.confirmed_at = Faker::Time.backward }

    it { is_expected.to be_confirmed }
  end

  context 'without confirmed_at' do
    before { user.confirmed_at = nil }

    it { is_expected.not_to be_confirmed }
  end

  describe '.confirmed' do
    subject { described_class.confirmed }

    let(:confirmed_user)   { create(:confirmed_user) }
    let(:unconfirmed_user) { create(:user)           }

    it { is_expected.to     include confirmed_user   }
    it { is_expected.not_to include unconfirmed_user }
  end
end
