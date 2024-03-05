# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon_deck, class: 'Pokemon::Deck' do
    name { Faker::App.name }
    user
  end
end
