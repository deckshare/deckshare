require 'rails_helper'

RSpec.describe "User", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/user"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/user/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/user/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
