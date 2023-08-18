require 'rails_helper'
RSpec.describe "口座情報機能", type: :system do
  context "口座情報新規作成" do
    it "登録を押して口座情報を作成する" do
      driver = FactoryBot.create(:driver)
      visit new_driver_session_path 
      fill_in "driver[email]", with: driver.email
      fill_in "driver[password]", with: "password"
      click_on "ログイン"
      visit driver_transfer_infos_path(driver)
      fill_in "transfer_info[bank_name]", with: "テスト"
      fill_in "transfer_info[branch_name]", with: "テスト"
      choose "transfer_info_account_type_ordinary"
      fill_in "transfer_info[account_number]", with: "11111111"
      fill_in "transfer_info[account_name]", with: "テスト"
      click_on "登 録"
      expect(page).to have_content "テスト"
    end
  end

  context "口座情報編集" do
    it "編集を押して口座情報を編集する" do
      driver = FactoryBot.create(:driver)
      transfer_info = FactoryBot.create(:transfer_info, driver: driver)
      visit new_driver_session_path 
      fill_in "driver[email]", with: driver.email
      fill_in "driver[password]", with: "password"
      click_on "ログイン"
      visit edit_driver_transfer_info_path(driver, transfer_info)
      fill_in "transfer_info[bank_name]", with: "更新テスト"
      fill_in "transfer_info[branch_name]", with: "テスト"
      choose "transfer_info_account_type_ordinary"
      fill_in "transfer_info[account_number]", with: "11111111"
      fill_in "transfer_info[account_name]", with: "テスト"
      click_on "登 録"
      expect(page).to have_content "更新テスト"
    end
  end

  context "口座情報削除" do
    it "削除を押して口座情報を無くす" do
      driver = FactoryBot.create(:driver)
      transfer_info = FactoryBot.create(:transfer_info, driver: driver)
      visit new_driver_session_path 
      fill_in "driver[email]", with: driver.email
      fill_in "driver[password]", with: "password"
      click_on "ログイン"
      visit driver_transfer_infos_path(driver)
      click_on "削 除"
      expect(page.accept_confirm).to eq "本当に削除してもよろしいですか？"
      expect(page).not_to have_content "テスト"
    end
  end
end