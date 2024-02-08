require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/session/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /" do
    let(:user) { FactoryBot.create(:user) }

    context "with correct credentials" do
      it "redirects to user show" do
        post "/session", params: { session: { email: user.email, password: user.password } }
        expect(response).to redirect_to(user_url)
      end
    end

    context "with incorrect password" do
      it "returns http unauthorized" do
        post "/session", params: { session: { email: user.email, password: Faker::Internet.password } }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with incorrect email" do
      it "returns http unauthorized" do
        post "/session", params: { session: FactoryBot.attributes_for(:user) }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "DELETE /" do
    it "redirects to session new" do
      delete "/session"
      expect(response).to redirect_to(new_session_url)
    end
  end

end
