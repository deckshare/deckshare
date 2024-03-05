# frozen_string_literal: true

FactoryBot.define do
  factory :deck do
    name { Faker::App.name }
    type { 'Pokemon::Deck' }
    user
  end
end
