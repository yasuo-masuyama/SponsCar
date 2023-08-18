require 'rails_helper'

RSpec.describe "ドライバーログイン", type: :system do
  describe "ログイン確認" do
    context "ログインしていない場合" do
      it "ログイン画面に移動する" do
        visit new_driver_session_path
        expect(page).to have_content "Driverログイン"
      end
    end
  end

  describe "ゲストログイン機能" do
    before do
      FactoryBot.create(:driver, email: 'driver1@example.com', password: 'password')
    end

    it "ゲストでログインする" do
      visit new_driver_session_path
      click_on "ゲストログイン（閲覧用）"
      expect(page).to have_content "ゲストユーザーとしてログインしました。"
    end
  end

  describe "セッション機能" do
    let(:driver) { FactoryBot.create(:driver) } # シーケンスを使用してdriverを作成

    before do
      visit new_driver_session_path 
      fill_in "driver[email]", with: driver.email
      fill_in "driver[password]", with: "password"
      click_on "ログイン"
    end
    
    context "ログインボタンをクリックした場合" do
      it "ログインが成功してトップページに移動する" do
        expect(page).to have_content "ログインしました。"
      end
    end

    context "ログアウトボタンをクリックした場合" do
      it "ログアウトする" do
        first(:link_or_button, "ログアウト").click
        expect(page).to have_content "ログアウトしました"
      end
    end
  end
end

