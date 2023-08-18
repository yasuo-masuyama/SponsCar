FactoryBot.define do
  factory :sponsor do
    company_name { "テスト" }
    company_name_kana { "テスト" }
    ceo_name { "テスト" }
    ceo_name_kana { "テスト" }
    postal_code { "1111111" }
    address { "東京都中央区" }
    telephone_number { "07011112222" }
    sequence(:email) { |n| "sponsor_test#{n}@example.com" }
    password { "password" }
    terms { "true" }

    after(:build) do |sponsor|
      sponsor.company_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'test.png')),
        filename: 'test.png',
        content_type: 'image/png'
      )
      sponsor.registry_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'test.png')),
        filename: 'test.png',
        content_type: 'image/jpeg'
      )
    end
  end

  factory :second_sponsor do
    company_name { "テスト" }
    company_name_kana { "テスト" }
    ceo_name { "テスト" }
    ceo_name_kana { "テスト" }
    postal_code { "1111111" }
    address { "東京都中央区" }
    telephone_number { "07011112222" }
    email { "test2@example.com" }
    password { "test_user2" }
    terms { "true" }

    after(:build) do |sponsor|
      sponsor.company_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'test.png')),
        filename: 'test.png',
        content_type: 'image/png'
      )
      sponsor.registry_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'test.png')),
        filename: 'test.png',
        content_type: 'image/jpeg'
      )
    end
  end
end
