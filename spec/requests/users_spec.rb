require 'rails_helper'

RSpec.describe "User", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /new" do
    context "without a current user" do
      it "returns http success" do
        get "/user/new"
        expect(response).to have_http_status(:success)
      end
    end

    context "with a current user" do
      before do
        post "/session", params: { session: { email: user.email, password: user.password } }
        expect(response).to redirect_to(user_url)
      end

      it "redirects to user show" do
        get "/user/new"
        assert_redirected_to user_url, status: :forbidden
      end
    end
  end

  describe "GET /edit" do
    before do
      post "/session", params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to(user_url)
    end

    it "returns http success" do
      get "/user/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /" do
    before do
      post "/session", params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to(user_url)
    end

    it "returns http success" do
      get "/user"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /" do
    before do
      post "/session", params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to(user_url)
    end

    it "redirects to show" do
      patch "/user"
      expect(response).to redirect_to(action: :show)
    end
  end

  describe "PUT /" do
    before do
      post "/session", params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to(user_url)
    end

    it "redirects to show" do
      put "/user"
      expect(response).to redirect_to(action: :show)
    end
  end

  describe "DELETE /" do
    before do
      post "/session", params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to(user_url)
    end

    it "redirects to new" do
      delete "/user"
      expect(response).to redirect_to(action: :new)
    end
  end

  describe "POST /" do
    subject(:_response) do
      post "/user", params: { user: }
      response
    end

    let(:user) { FactoryBot.attributes_for(:user) }

    context "with valid params" do
      it { is_expected.to redirect_to(action: :show) }
    end

    context "with invalid params" do
      before { User.create(user) }

      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end

end
