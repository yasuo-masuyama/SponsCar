# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
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

5.times do |i|
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

5.times do |i|
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
  company_name: "(株)ネクストウェーブ",
  company_name_kana:"カブネクストウェーブ",
  ceo_name: Gimei.name.kanji,
  ceo_name_kana: Gimei.name.katakana,
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
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
  company_name: "(株)Lalana",
  company_name_kana:"カブララナ",
  ceo_name: Gimei.name.kanji,
  ceo_name_kana: Gimei.name.katakana,
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
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
  company_name: "(株)共創ソリューションズ",
  company_name_kana:"カブキョウソウソリューションズ",
  ceo_name: Gimei.name.kanji,
  ceo_name_kana: Gimei.name.katakana,
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
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
  company_name: "(株)キッチンオンライン",
  company_name_kana:"カブキッチンオンライン",
  ceo_name: Gimei.name.kanji,
  ceo_name_kana: Gimei.name.katakana,
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
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
  "住宅・インテリア",
  "求人・転職"
]

genres.each_with_index do |genre_name, i|
  Genre.create!(
    id: i + 1,
    name: genre_name,
    flag_active: true
  )
end

5.times do |i|
  Info.create!(
    id: i + 1,
    title: "テスト",
    content: "テスト",
    viewer_type: ['both', 'sponsor', 'driver'].sample
  )
end

5.times do |i|
  name = Gimei.name

  Contact.create!(
    id: i + 1,
    name: name.kanji,
    company_name: "テスト",
    telephone_number: Faker::PhoneNumber.phone_number,
    email: "contact#{i + 1}@example.com",
    content: "テスト",
    work_status: ["new_inquiry", "working_inquiry", "past_inquiry"].sample
  )
end

5.times do |i|
  Admin.create!(
    id: i + 1,
    email: "admin#{i + 1}@example.com",
    name: "マスター#{i + 1}", name_kana:"マスター#{i + 1}",
    password: "admin#{i + 1}",
    password_confirmation: "admin#{i + 1}",
  )
end

Advertisement.create!(
  id: 1,
  sponsor_id: 1,
  genre_id: 9,
  title: "スタッフ募集ポスター",
  heading: "保育士の方大募集！",
  content: "契約更新！広告業務の継続的なドライバー募集中。広告ポスターは提供します。応募お待ちしております。",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/advertisements/advertisement1.png")), filename: "advertisement1.png"),
  amounts: 10000,
  is_active: true,
  start_due_on: "2023-09-01",
  end_due_on: "2023-09-30"
)

Advertisement.create!(
  id: 2,
  sponsor_id: 2,
  genre_id: 11,
  title: "正社員募集ポスター",
  heading: "Webデザイナー・プログラマー大募集！",
  content: "契約更新！広告業務の継続的なドライバー募集中。広告ポスターは提供します。応募お待ちしております。",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/advertisements/advertisement2.png")), filename: "advertisement2.png"),
  amounts: 5000,
  is_active: true,
  start_due_on: "2023-09-01",
  end_due_on: "2023-09-15"
)

Advertisement.create!(
  id: 3,
  sponsor_id: 3,
  genre_id: 9,
  title: "マーケティングセミナーポスター",
  heading: "明日から実践できるAIを使ったマーケティングセミナー",
  content: "契約更新！広告業務の継続的なドライバー募集中。広告ポスターは提供します。応募お待ちしております。",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/advertisements/advertisement3.png")), filename: "advertisement3.png"),
  amounts: 20000,
  is_active: true,
  start_due_on: "2023-09-01",
  end_due_on: "2023-10-15"
)

Advertisement.create!(
  id: 4,
  sponsor_id: 4,
  genre_id: 9,
  title: "経営コンサルセミナーポスター",
  heading: "経営コンサルが語る、課題を一緒に解決する",
  content: "契約更新！広告業務の継続的なドライバー募集中。広告ポスターは提供します。応募お待ちしております。",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/advertisements/advertisement4.png")), filename: "advertisement4.png"),
  amounts: 20000,
  is_active: true,
  start_due_on: "2023-09-01",
  end_due_on: "2023-10-15"
)

Advertisement.create!(
  id: 5,
  sponsor_id: 5,
  genre_id: 3,
  title: "お料理教室ポスター",
  heading: "オンラインお料理教室！大好評参加者募集中！",
  content: "契約更新！広告業務の継続的なドライバー募集中。広告ポスターは提供します。応募お待ちしております。",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/advertisements/advertisement5.png")), filename: "advertisement5.png"),
  amounts: 3000,
  is_active: true,
  start_due_on: "2023-09-01",
  end_due_on: "2023-09-15"
)

5.times do |i|
  Favorite.create!(
    id: i + 1,
    driver_id: i + 1,
    advertisement_id: i + 1
  )
end

5.times do |i|
  UnderDeal.create!(
    id: i + 1,
    advertisement_id: i + 1,
    driver_id: i + 1,
    work_status: "approval_pending"
  )
end

5.times do |i|
  DealMessage.create!(
    under_deal_id: 1,
    message: "テスト",
    user_type: ['sponsor', 'driver'].sample
  )
end