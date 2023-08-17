FactoryBot.define do
  factory :driver do
		name { "テスト" }
		name_kana { "テスト" }
		postal_code { "1111111" }
		address { "東京都中央区" }
		activity_area { "東京都中央区" }
		telephone_number { "07011112222" }
		email { "test@example.com" }
    password { "password" }
		terms { "true" }
  end
end