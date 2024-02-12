FactoryBot.define do
  factory :deckshare_pokemon_card, class: 'Deckshare::Pokemon::Card' do
    user
    card_id { "xy1-1" }
    quantity { 1 }
  end
end
