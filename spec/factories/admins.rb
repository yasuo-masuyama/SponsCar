FactoryBot.define do
  factory :admin do
    name { "テスト" }
    name_kana { "テスト" }
    email { "admin_test@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
