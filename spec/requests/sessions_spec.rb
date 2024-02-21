require 'rails_helper'

RSpec.describe "Session", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /new" do
    it_behaves_like "an unauthenticated route" do
      let(:request) { get "/session/new" }
    end
  end

  describe "POST /" do
    subject(:_response) do
      post "/session", params: { session: { email:, password: } }
      response
    end

    context "with correct credentials" do
      let(:email) { user.email }
      let(:password) { user.password }

      it { is_expected.to redirect_to(user_url) }
    end

    context "with incorrect password" do
      let(:email) { user.email }
      let(:password) { Faker::Internet.password }

      it { is_expected.to have_http_status(:unauthorized) }
    end

    context "with incorrect email" do
      let(:email) { Faker::Internet.email }
      let(:password) { Faker::Internet.password }

      it { is_expected.to have_http_status(:unauthorized) }
    end
  end

  describe "DELETE /" do
    it_behaves_like "an authenticated route" do
      let(:request) { delete "/session" }
      let(:match_expectation) { redirect_to(new_session_url) }
    end
  end
end
