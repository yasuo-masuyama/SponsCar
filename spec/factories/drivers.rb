FactoryBot.define do
  factory :driver do
		name { "テスト" }
		name_kana { "テスト" }
		postal_code { "1111111" }
		address { "東京都中央区" }
		activity_area { "東京都中央区" }
		telephone_number { "07011112222" }
		sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
		terms { "true" }
		after(:build) do |driver|
			driver.profile_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test.png')), filename: 'test.png', content_type: 'image/png')
		end		
  end
end