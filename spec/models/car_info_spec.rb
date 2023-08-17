require 'rails_helper'

RSpec.describe CarInfo, type: :model do
  it "カー情報のファクトリが有効かテスト" do
    expect(FactoryBot.build(:car_info)).to be_valid
  end

  it "製造業者の名前が未入力の場合、登録ができない" do
    car_info = FactoryBot.build(:car_info, manufacturer_name: nil)
    car_info.valid?
    expect(car_info.errors[:manufacturer_name]).to include("が入力されていません。")
  end

  it "車の名前が未入力の場合、登録ができない" do
    car_info = FactoryBot.build(:car_info, name: nil)
    car_info.valid?
    expect(car_info.errors[:name]).to include("が入力されていません。")
  end
  
  it "車の画像が未入力の場合、登録ができない" do
    car_info = FactoryBot.build(:car_info, vehicle_image: nil)
    car_info.valid?
    expect(car_info.errors[:vehicle_image]).to include("が入力されていません。")
  end
  
  it "車の画像のフォーマットが不正な場合、登録ができない" do
    car_info = FactoryBot.build(:car_info)
    car_info.vehicle_image.attach(io: StringIO.new('not an image'), filename: 'test.txt', content_type: 'text/plain')
    car_info.valid?
    expect(car_info.errors[:vehicle_image]).to include("のファイル形式が不正です。")
  end
end

