# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin1@example.com",
  name: "管理者", name_kana:"カンリシャ",
  password: "admin_user",
  password_confirmation: "admin_user",
)

Driver.create!(
  email: "driver1@example.com",
  name: "Mr.インクレディブル",
  name_kana: "ミスターインクレディブル",
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/drivers/driver1.png")), filename: "driver1.png"),
  license_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/license_image.png")), filename: 'license_image.png'),
  is_active: true,
  terms: true,
  activity_area: Gimei.prefecture.kanji + Gimei.city.kanji,
  password: "driver1",
  password_confirmation: "driver1"
)

Driver.create!(
  email: "driver2@example.com",
  name: "イラスティガール",
  name_kana: "イラスティガール",
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/drivers/driver2.png")), filename: "driver2.png"),
  license_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/license_image.png")), filename: 'license_image.png'),
  is_active: true,
  terms: true,
  activity_area: Gimei.prefecture.kanji + Gimei.city.kanji,
  password: "driver2",
  password_confirmation: "driver2"
)

Driver.create!(
  email: "driver3@example.com",
  name: "ヴァイオレット",
  name_kana: "ヴァイオレット",
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/drivers/driver3.png")), filename: "driver3.png"),
  license_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/license_image.png")), filename: 'license_image.png'),
  is_active: true,
  terms: true,
  activity_area: Gimei.prefecture.kanji + Gimei.city.kanji,
  password: "driver3",
  password_confirmation: "driver3"
)

Driver.create!(
  email: "driver4@example.com",
  name: "ダッシュ",
  name_kana: "ダッシュ",
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/drivers/driver4.png")), filename: "driver4.png"),
  license_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/license_image.png")), filename: 'license_image.png'),
  is_active: true,
  terms: true,
  activity_area: Gimei.prefecture.kanji + Gimei.city.kanji,
  password: "driver4",
  password_confirmation: "driver4"
)

Driver.create!(
  email: "driver5@example.com",
  name: "ジャック・ジャック",
  name_kana: "ジャックジャック",
  postal_code: Faker::Address.zip_code,
  address: Gimei.prefecture.kanji + Gimei.city.kanji,
  telephone_number: Faker::PhoneNumber.phone_number,
  profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/drivers/driver5.png")), filename: "driver5.png"),
  license_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/license_image.png")), filename: 'license_image.png'),
  is_active: true,
  terms: true,
  activity_area: Gimei.prefecture.kanji + Gimei.city.kanji,
  password: "driver5",
  password_confirmation: "driver5"
)

5.times do |i|
  CarInfo.create!(
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
    driver_id: i + 1,
    bank_name: "三菱UFJ銀行",
    branch_name: ['本店', '丸の内支店', '市ヶ谷支店', '松戸支店', '柏市店'].sample, 
    account_number: Faker::Bank.account_number(digits: 9),
    account_type: ['ordinary', 'checking'].sample,
    account_name: driver.name_kana
  )
end

Sponsor.create!(
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

genres.each do |genre_name|
  Genre.create!(
    name: genre_name,
    flag_active: true
  )
end

Advertisement.create!(
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