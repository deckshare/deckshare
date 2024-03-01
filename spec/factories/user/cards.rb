# frozen_string_literal: true

FactoryBot.define do
  factory :user_card, class: 'User::Card' do
    user
    card { nil }
    quantity { 1 }
  end
end
