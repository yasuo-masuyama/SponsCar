require 'rails_helper'
RSpec.describe "管理者ログイン", type: :system do
  describe "ログイン確認" do
    context "ログインしていない場合" do
      it "ログイン画面に移動する" do
        visit new_admin_session_path
        expect(page).to have_content "Adminログイン"
      end
    end
  end

  describe "ゲストログイン機能" do
    before do
      FactoryBot.create(:admin, email: 'admin1@example.com', password: 'password')
    end

    it "ゲスト管理者でログインする" do
      visit new_admin_session_path
      click_on "ゲストログイン（閲覧用）"
      expect(page).to have_content "管理者ページ"
    end
  end

  describe "セッション機能" do
    let(:admin) { FactoryBot.create(:admin) }

    before do
      visit new_admin_session_path 
      fill_in "admin[email]", with: admin.email
      fill_in "admin[password]", with: "password"
      click_on "ログイン"
    end
    
    context "ログインをクリックした場合" do
      it "ログインが成功してトップページに移動する" do
        expect(page).to have_content "ログインしました。"
      end
    end

    context "ログアウトをクリックした場合" do
      it "ログアウトする" do
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました"
      end
    end
  end
end
