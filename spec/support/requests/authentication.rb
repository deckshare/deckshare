RSpec.shared_examples "an authenticated route" do
  let(:match_expectation) { have_http_status(:success) }
  let(:_user) { FactoryBot.create(:user) }

  subject(:_response) do
    request
    response
  end

  context "without a current user" do
    it "redirects to /session/new" do
      _response
      assert_redirected_to new_session_url, status: :unauthorized
    end
  end

  context "with a current user" do
    before { authenticate_as(_user) }

    it { is_expected.to match_expectation }
  end
end

RSpec.shared_examples "an unauthenticated route" do
  let(:match_expectation) { have_http_status(:success) }
  let(:_user) { FactoryBot.create(:user) }

  subject(:_response) do
    request
    response
  end

  context "without a current user" do
    it { is_expected.to match_expectation }
  end

  context "with a current user" do
    before { authenticate_as(_user) }

    it "redirects to /user" do
      _response
      assert_redirected_to user_url, status: :forbidden
    end
  end
end

def authenticate_as(user)
  post "/session", params: { session: { email: user.email, password: user.password } }
  expect(response).to redirect_to(user_url)
end
