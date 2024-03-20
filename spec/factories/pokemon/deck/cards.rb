# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon_deck_card, class: 'Pokemon::Deck::Card' do
    deck { nil }
    card { nil }
    quantity { 1 }
  end
end
