# frozen_string_literal: true

FactoryBot.define do
  factory :deck do
    name { Faker::App.name }
    deck_type { Deck::DECK_TYPE_POKEMON }
    user
  end
end
