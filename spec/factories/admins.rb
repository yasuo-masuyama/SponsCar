FactoryBot.define do
  factory :admin do
    name { "テスト" }
    name_kana { "テスト" }
    sequence(:email) { |n| "admin_test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
