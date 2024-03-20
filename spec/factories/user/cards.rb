FactoryBot.define do
  factory :user_card, class: 'User::Card' do
    user { nil }
    card { nil }
    quantity { 1 }
  end
end
