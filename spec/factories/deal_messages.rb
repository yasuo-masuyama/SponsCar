FactoryBot.define do
  factory :deal_message do
    under_deal
    message { "テスト" }
    user_type { "driver" }
  end
end