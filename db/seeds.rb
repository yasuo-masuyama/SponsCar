# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  id: 1,
  email: 'admin1@gmail.com',
  name: "マスター", name_kana:"マスター",
  password: "admin1",
  password_confirmation: "admin1",
)

10.times do |i|
  name = Gimei.name
  address = Gimei.address

Driver.create!(
  id: i + 1,
  email: "driver#{i + 1}@example.com",
  name: name.kanji,
  name_kana: name.katakana,
  postal_code: Faker::Address.zip_code,
  address: address.prefecture.kanji + address.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/drivers/driver#{i + 1}.png")), filename: "driver#{i + 1}.png"),
  license_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/license_image.png")), filename: 'license_image.png'),
  is_active: true,
  terms: true,
  activity_area: address.prefecture.kanji + address.city.kanji,
  password: "driver#{i + 1}",
  password_confirmation: "driver#{i + 1}"
)
end

10.times do |i|
  CarInfo.create!(
    id: i + 1,
    driver_id: i + 1,
    manufacturer_name: 'Honda',
    name: ['シビックTypeR', 'ステップワゴン', 'N-BOX', 'ヴェゼル', 'NSX'].sample,
    flame_number: Faker::Vehicle.vin,
    license_plate: "#{Faker::Address.state_abbr} #{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}",
    vehicle_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/drivers/vehicle_image.png")), filename: "vehicle_image.png", content_type: "image/png")
  )
end

10.times do |i|
  driver = Driver.find(i + 1)

  TransferInfo.create!(
    id: i + 1,
    driver_id: i + 1,
    bank_name: "三菱UFJ銀行",
    branch_name: ['本店', '丸の内支店', '市ヶ谷支店'].sample, 
    account_number: Faker::Bank.account_number(digits: 9),
    account_type: ['ordinary', 'checking'].sample,
    account_name: driver.name_kana
  )
end

name = Gimei.name
address = Gimei.address

Sponsor.create!(
  id: 1,
  email: 'sponsor1@example.com',
  company_name: "（株）ゲスト広告",
  company_name_kana:"カブゲストコウコク",
  ceo_name: "ゲスト太郎",
  ceo_name_kana:"ゲストタロウ",
  postal_code: "1203749",
  address: "東京都新宿区",
  telephone_number: Faker::PhoneNumber.phone_number,
  company_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/sponsor1.png")), filename: "sponsor1.png"),
  registry_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/registry_image.png")), filename: "registry_image.png"),
  terms: true,
  password: "sponsor1",
  password_confirmation: "sponsor1",
  )

Sponsor.create!(
  id: 2,
  email: 'sponsor2@example.com',
  company_name: "（株）ブルースカイテック",
  company_name_kana:"カブブルースカイテック",
  ceo_name: name.kanji,
  ceo_name_kana: name.katakana,
  postal_code: Faker::Address.zip_code,
  address: address.prefecture.kanji + address.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  company_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/sponsor2.png")), filename: "sponsor2.png"),
  registry_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/registry_image.png")), filename: "registry_image.png"),
  terms: true,
  password: "sponsor2",
  password_confirmation: "sponsor2",
  )

Sponsor.create!(
  id: 3,
  email: 'sponsor3@example.com',
  company_name: "（株）グリーンフィールドソリューションズ",
  company_name_kana:"カブグリーンフィールドソリューションズ",
  ceo_name: name.kanji,
  ceo_name_kana: name.katakana,
  postal_code: Faker::Address.zip_code,
  address: address.prefecture.kanji + address.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  company_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/sponsor3.png")), filename: "sponsor3.png"),
  registry_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/registry_image.png")), filename: "registry_image.png"),
  terms: true,
  password: "sponsor3",
  password_confirmation: "sponsor3",
  )

Sponsor.create!(
  id: 4,
  email: 'sponsor4@example.com',
  company_name: "（株）サンライズイノベーション",
  company_name_kana:"カブサンライズイノベーション",
  ceo_name: name.kanji,
  ceo_name_kana: name.katakana,
  postal_code: Faker::Address.zip_code,
  address: address.prefecture.kanji + address.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  company_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/sponsor4.png")), filename: "sponsor4.png"),
  registry_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/registry_image.png")), filename: "registry_image.png"),
  terms: true,
  password: "sponsor4",
  password_confirmation: "sponsor4",
  )

Sponsor.create!(
  id: 5,
  email: 'sponsor5@example.com',
  company_name: "（株）ディープブルーシステムズ",
  company_name_kana:"カブディープブルーシステムズ",
  ceo_name: name.kanji,
  ceo_name_kana: name.katakana,
  postal_code: Faker::Address.zip_code,
  address: address.prefecture.kanji + address.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  company_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/sponsor5.png")), filename: "sponsor5.png"),
  registry_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sponsors/registry_image.png")), filename: "registry_image.png"),
  terms: true,
  password: "sponsor5",
  password_confirmation: "sponsor5",
  )

genres = [
  "自動車・バイク",
  "ファッション",
  "食品・飲料",
  "家電・テクノロジー",
  "エンターテインメント",
  "スポーツ・アウトドア",
  "旅行・観光",
  "ビューティ・健康",
  "書籍・教育",
  "住宅・インテリア"
]

genres.each_with_index do |genre_name, i|
  Genre.create!(
    id: i + 1,
    name: genre_name,
    flag_active: true
  )
end