require "rails_helper"

RSpec.describe Driver, type: :model do
	it "ドライバーのファクトリが有効かテスト" do
		expect(FactoryBot.build(:driver)).to be_valid
	end

  it "ドライバーの新規登録ができる" do
    driver = Driver.new(
      name: "テスト",
      name_kana: "テスト",
      postal_code: "1111111",
      address: "東京都中央区",
      activity_area: "東京都中央区",
      telephone_number: "07011112222",
      email: "test@example.com",
      password: "test_user",
      terms: "true",
    )
  
    driver.profile_image.attach(
      io: File.open(Rails.root.join("spec/fixtures/test.png")),
      filename: 'test.jpg',
      content_type: 'image/png'
    )
  
    driver.license_image.attach(
      io: File.open(Rails.root.join("spec/fixtures/test.png")),
      filename: 'test.jpg',
      content_type: 'image/png'
    )
  
    expect(driver).to be_valid
  end
  
  it "ドライバーの名前が未入力の場合、登録ができない" do
    driver = FactoryBot.build(:driver, name: nil)
    driver.valid?
    expect(driver.errors[:name]).to_not include("入力されていません")
  end

  it "ドライバーの名前のカナが未入力の場合、登録ができない" do
    driver = FactoryBot.build(:driver, name_kana: nil)
    driver.valid?
    expect(driver.errors[:name_kana]).to_not include("入力されていません")
  end

  it "ドライバーの住所が未入力の場合、登録ができない" do
    driver = FactoryBot.build(:driver, address: nil)
    driver.valid?
    expect(driver.errors[:address]).to_not include("入力されていません")
  end

  it "ドライバーの電話番号が未入力の場合、登録できない" do
    driver = FactoryBot.build(:driver, telephone_number: nil)
    driver.valid?
    expect(driver.errors[:telephone_number]).to_not include("入力されていません")
  end

  it "ドライバーのメールが未入力の場合、登録できない" do
    driver = FactoryBot.build(:driver, email: nil)
    driver.valid?
    expect(driver.errors[:email]).to_not include("入力されていません")
  end
	it "利用規約に同意していない場合、登録できない" do
    driver = FactoryBot.build(:driver, terms: false)
    driver.valid?
    expect(driver.errors[:terms]).to_not include("入力されていません")
  end

  it "メールアドレスの重複がないかテスト" do
    FactoryBot.create(:driver, email: "test1@example.com")
    driver = FactoryBot.build(:driver, email: "test1@example.com")
    driver.valid?
    expect(driver.errors[:email]).to_not include("使用されています")
	end

  it "ドライバーの名前がstring型であるかテスト" do
		driver = FactoryBot.build(:driver, name: "テスト")
		expect(driver.name).to eq "テスト"
	end
end