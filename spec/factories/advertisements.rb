FactoryBot.define do
  factory :advertisement do
    association :sponsor
    association :genre
    title { "テスト" }
    content { "テスト" }
    heading { "テスト" }
    amounts { 1000 }
    start_due_on { Date.current }
    end_due_on { Date.current + 7.days }

    after(:build) do |advertisement|
      advertisement.image.attach(io: File.open(Rails.root.join("spec/fixtures/test.png")), filename: 'test.png', content_type: 'image/png')
    end
  end
end
