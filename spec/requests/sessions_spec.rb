require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /new" do
    context "without a current user" do
      it "returns http success" do
        get "/session/new"
        expect(response).to have_http_status(:success)
      end
    end

    context "with a current user" do
      before do
        post "/session", params: { session: { email: user.email, password: user.password } }
        expect(response).to redirect_to(user_url)
      end

      it "redirects to user show" do
        get "/session/new"
        expect(response).to redirect_to(user_url)
      end
    end
  end

  describe "POST /" do
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
      post "/session", params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to(user_url)

      delete "/session"
      expect(response).to redirect_to(new_session_url)
    end
  end

end
