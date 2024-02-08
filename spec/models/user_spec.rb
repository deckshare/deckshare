require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  it { is_expected.to be_valid }

  context "with an invalid email address" do
    before { user.email.sub!("@", "__") }

    it { is_expected.not_to be_valid }
  end
end
