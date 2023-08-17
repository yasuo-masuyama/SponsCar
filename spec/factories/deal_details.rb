FactoryBot.define do
  factory :deal_detail do
    under_deal
    payment_amount { 3000 }
    bank_name { "テスト" }
    branch_name { "テスト" }
    account_type { "ordinary" }
    account_number { "1111111" }
    account_name { "テスト" }
    transfer_status { "not_transfer" }
  end
end
