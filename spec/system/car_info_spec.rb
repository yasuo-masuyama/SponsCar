require 'rails_helper'
RSpec.describe "車両情報機能", type: :system do
  context "車両情報新規作成" do
    it "登録を押して車両情報を作成する" do
      driver = FactoryBot.create(:driver)
      visit new_driver_session_path 
      fill_in "driver[email]", with: driver.email
      fill_in "driver[password]", with: "password"
      click_on "ログイン"
      visit driver_car_infos_path(driver)
      fill_in "car_info[manufacturer_name]", with: "テスト"
      fill_in "car_info[name]", with: "テスト"
      fill_in "car_info[flame_number]", with: "1111111"
      fill_in "car_info[license_plate]", with: "11111111"
      path_to_image = Rails.root.join('spec', 'fixtures', 'test.png')
      attach_file 'car_info[vehicle_image]', path_to_image
      click_on "登 録"
      expect(page).to have_content "テスト"
    end
  end

  context "車両情報編集" do
    it "編集を押して車両情報を編集する" do
      driver = FactoryBot.create(:driver)
      car_info = FactoryBot.create(:car_info, driver: driver)
      visit new_driver_session_path 
      fill_in "driver[email]", with: driver.email
      fill_in "driver[password]", with: "password"
      click_on "ログイン"
      visit edit_driver_car_info_path(driver, car_info)
      fill_in "car_info[manufacturer_name]", with: "更新テスト"
      fill_in "car_info[name]", with: "テスト"
      fill_in "car_info[flame_number]", with: "1111111"
      fill_in "car_info[license_plate]", with: "11111111"
      path_to_image = Rails.root.join('spec', 'fixtures', 'test.png')
      attach_file 'car_info[vehicle_image]', path_to_image
      click_on "登 録"
      expect(page).to have_content "更新テスト"
    end
  end

  context "車両情報削除" do
    it "削除を押して車両情報を削除する" do
      driver = FactoryBot.create(:driver)
      car_info = FactoryBot.create(:car_info, driver: driver)
      visit new_driver_session_path 
      fill_in "driver[email]", with: driver.email
      fill_in "driver[password]", with: "password"
      click_on "ログイン"
      visit driver_car_infos_path(driver)
      click_on "削 除"
      expect(page.accept_confirm).to eq "本当に削除してもよろしいですか？"
      expect(page).not_to have_content "テスト"
    end
  end
end