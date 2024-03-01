require 'rails_helper'

RSpec.describe "Pokemon::Cards", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/pokemon/cards"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /:id" do
    subject(:_response) do
      get "/pokemon/cards/#{id}"
      response
    end

    context "with a valid ID" do
      let(:id) { "sv4pt5-59" }

      it { is_expected.to have_http_status(:success) }
    end

    context "with an invalid ID" do
      let(:id) { "invalid_id" }

      it { is_expected.to have_http_status(:not_found) }
    end
  end
end
