# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User' do
  let(:user) { create(:user) }

  describe 'GET /new' do
    it_behaves_like 'an unauthenticated route' do
      let(:request) { get '/user/new' }
    end
  end

  describe 'GET /edit' do
    it_behaves_like 'an authenticated route' do
      let(:request) { get '/user/edit' }
    end
  end

  describe 'GET /' do
    it_behaves_like 'an authenticated route' do
      let(:request) { get '/user' }
    end
  end

  describe 'PATCH /' do
    it_behaves_like 'an authenticated route' do
      let(:request) { patch '/user' }
      let(:match_expectation) { redirect_to(action: :show) }
    end
  end

  describe 'PUT /' do
    it_behaves_like 'an authenticated route' do
      let(:request) { put '/user' }
      let(:match_expectation) { redirect_to(action: :show) }
    end
  end

  describe 'DELETE /' do
    it_behaves_like 'an authenticated route' do
      let(:request) { delete '/user' }
      let(:match_expectation) { redirect_to(action: :new) }
    end
  end

  describe 'POST /' do
    subject(:_response) do
      post '/user', params: { user: }
      response
    end

    let(:user) { attributes_for(:user) }

    it_behaves_like 'an unauthenticated route' do
      let(:request) { post '/user', params: { user: } }
      let(:match_expectation) { redirect_to(action: :show) }
    end

    context 'with invalid params' do
      before { User.create(user) }

      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end
end
