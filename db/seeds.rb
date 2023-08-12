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

name = Gimei.name

10.times do |i|
  name = Gimei.name

  Driver.create!(
    id: i + 1,
    email: "driver#{i + 1}@example.com",
    name: name.kanji,
    name_kana: name.katakana,
    postal_code: Faker::Address.zip_code,
    address: Gimei.address.kanji,
    telephone_number: Faker::PhoneNumber.phone_number,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/drivers/driver#{i + 1}.png")), filename: "driver#{i + 1}.png"),
    license_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/license_image.png")), filename: 'license_image.png'),
    is_active: true,
    terms: true,
    activity_area: Gimei.address.kanji,
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