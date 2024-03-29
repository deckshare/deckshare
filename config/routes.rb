# frozen_string_literal: true

Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '_up' => 'rails/health#show', as: :rails_health_check

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :collection, only: %i[show]
  resource :session, only: %i[new create destroy]
  resource :user

  namespace :pokemon do
    resources :cards, only: %i[index show]
  end

  # Defines the root path route ("/")
  root 'home#index'
end
