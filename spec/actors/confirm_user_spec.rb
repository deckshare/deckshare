# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConfirmUser do
  describe '#call' do
    subject { actor.call }

    let(:actor) { described_class.new(user:) }

    before { freeze_time }

    after { unfreeze_time }

    context 'with an unconfirmed user' do
      let(:user) { create(:user) }

      before { user.expects(:update!).with(confirmed_at: Time.zone.now) }

      it { is_expected.to be_nil }
    end

    context 'with a confirmed user' do
      let(:user) { create(:confirmed_user) }

      before { user.expects(:update!).never }

      it { is_expected.to be_nil }
    end
  end
end
