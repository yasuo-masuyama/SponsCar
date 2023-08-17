FactoryBot.define do
  factory :favorite do
    association :driver
    association :advertisement
  end
end