require 'rails_helper'

RSpec.describe Sponsor, type: :model do
	it "スポンサーのファクトリが有効かテスト" do
		expect(FactoryBot.build(:sponsor)).to be_valid
	end

  it "スポンサーの新規登録ができる" do
    sponsor = Sponsor.new(
      company_name: "テスト",
      company_name_kana: "テスト",
      ceo_name: "テスト",
      ceo_name_kana: "テスト",
      postal_code: "1111111",
      address: "東京都中央区",
      telephone_number: "07011112222",
      email: "test@example.com",
      password: "test_user",
      terms: "true",
    )
  
    sponsor.company_image.attach(
      io: File.open(Rails.root.join("spec/fixtures/test.png")),
      filename: 'test.jpg',
      content_type: 'image/png'
    )
  
    sponsor.registry_image.attach(
      io: File.open(Rails.root.join("spec/fixtures/test.png")),
      filename: 'test.jpg',
      content_type: 'image/png'
    )
  
    expect(sponsor).to be_valid
  end

  it "スポンサーの名前が未入力の場合、登録ができない" do
    sponsor = FactoryBot.build(:sponsor, company_name: nil)
    sponsor.valid?
    expect(sponsor.errors[:company_name]).to_not include("入力されていません")
  end

  it "スポンサーの名前のカナが未入力の場合、登録ができない" do
    sponsor = FactoryBot.build(:sponsor, company_name_kana: nil)
    sponsor.valid?
    expect(sponsor.errors[:company_name_kana]).to_not include("入力されていません")
  end

  it "スポンサーの住所が未入力の場合、登録ができない" do
    sponsor = FactoryBot.build(:sponsor, address: nil)
    sponsor.valid?
    expect(sponsor.errors[:address]).to_not include("入力されていません")
  end

  it "スポンサーの電話番号が未入力の場合、登録ができない" do
    sponsor = FactoryBot.build(:sponsor, telephone_number: nil)
    sponsor.valid?
    expect(sponsor.errors[:telephone_number]).to_not include("入力されていません")
  end

  it "スポンサーのメールが未入力の場合、登録ができない" do
    sponsor = FactoryBot.build(:sponsor, email: nil)
    sponsor.valid?
    expect(sponsor.errors[:email]).to_not include("入力されていません")
  end
	it "スポンサーの名前が未入力の場合、登録ができない" do
    sponsor = FactoryBot.build(:sponsor, terms: false)
    sponsor.valid?
    expect(sponsor.errors[:terms]).to_not include("入力されていません")
  end

  it "利用規約に同意していない場合、登録できない" do
    FactoryBot.create(:sponsor)
    sponsor = FactoryBot.build(:sponsor)
    sponsor.valid?
    expect(sponsor.errors[:email]).to_not include("使用されています")
	end
	it "メールアドレスの重複がないかテスト" do
    FactoryBot.create(:sponsor, email: "test1@example.com")
    sponsor = FactoryBot.build(:sponsor, email: "test1@example.com")
    sponsor.valid?
    expect(sponsor.errors[:email]).to_not include("使用されています")
	end

	it "スポンサーの名前がstring型であるかテスト" do
		sponsor = FactoryBot.build(:sponsor, company_name: "テスト")
		expect(sponsor.company_name).to eq "テスト"
	end
end