FactoryBot.define do
  factory :transfer_info do
    driver
    bank_name { "テスト" }
    branch_name { "テスト" }
    account_number { "11111111" }
    account_type { "ordinary" }
    account_name { "テスト" }
  end
end
