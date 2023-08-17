FactoryBot.define do
  factory :under_deal do
    association :advertisement
    association :driver
    work_status  { "approval_pending" }
  end
end