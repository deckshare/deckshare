# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    transient do
      user { Faker::Internet.user(*%w[username email password]) }
    end

    username { user[:username] }
    email    { user[:email]    }
    password { user[:password] }

    factory :confirmed_user do
      confirmed_at { Faker::Time.backward }
    end
  end
end
