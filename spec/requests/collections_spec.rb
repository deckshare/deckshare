# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Collections' do
  let(:user) { create(:user) }

  describe 'GET /' do
    it_behaves_like 'an authenticated route' do
      let(:request) { get '/collection' }
    end
  end
end
