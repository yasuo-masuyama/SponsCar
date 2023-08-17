require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  before do
    @sponsor = FactoryBot.create(:sponsor)
    @genre = FactoryBot.create(:genre)
    @driver = FactoryBot.create(:driver)
  end

  it "広告のファクトリが有効かテスト" do
    advertisement = FactoryBot.build(:advertisement, sponsor: @sponsor, genre: @genre)
    expect(advertisement).to be_valid
  end

  it "スポンサーIDが存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, sponsor_id: nil)
    advertisement.valid?
    expect(advertisement.errors[:sponsor_id]).to include("が入力されていません。")
  end

  it "ジャンルIDが存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, genre_id: nil)
    advertisement.valid?
    expect(advertisement.errors[:genre_id]).to include("が入力されていません。")
  end

  it "ジャンルIDが存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, genre_id: nil)
    advertisement.valid?
    expect(advertisement.errors[:genre_id]).to include("が入力されていません。")
  end

  it "タイトルが存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, title: nil)
    advertisement.valid?
    expect(advertisement.errors[:title]).to include("が入力されていません。")
  end
  
  it "内容が存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, content: nil)
    advertisement.valid?
    expect(advertisement.errors[:content]).to include("が入力されていません。")
  end

  it "見出しが存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, heading: nil)
    advertisement.valid?
    expect(advertisement.errors[:heading]).to include("が入力されていません。")
  end

  it "広告金額が存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, amounts: nil)
    advertisement.valid?
    expect(advertisement.errors[:amounts]).to include("が入力されていません。")
  end

  it "広告開始日が存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, start_due_on: nil)
    advertisement.valid?
    expect(advertisement.errors[:start_due_on]).to include("が入力されていません。")
  end

  it "広告終了日が存在しない場合、登録できない" do
    advertisement = FactoryBot.build(:advertisement, end_due_on: nil)
    advertisement.valid?
    expect(advertisement.errors[:end_due_on]).to include("が入力されていません。")
  end

  it "特定のドライバーがお気に入りにしているか確認" do
    advertisement = FactoryBot.create(:advertisement, genre: @genre, sponsor: @sponsor)
    FactoryBot.create(:favorite, advertisement: advertisement, driver: @driver)
    expect(advertisement.favorited_by?(@driver)).to eq true
  end

  it "特定のドライバーがお気に入りにしていない場合確認" do
    advertisement = FactoryBot.create(:advertisement, genre: @genre, sponsor: @sponsor)
    expect(advertisement.favorited_by?(@driver)).to eq false
  end
end
