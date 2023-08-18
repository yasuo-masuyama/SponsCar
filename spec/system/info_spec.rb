require 'rails_helper'
RSpec.describe "お知らせ管理機能", type: :system do
  
  before do
    FactoryBot.create(:admin)
    visit new_admin_session_path 
    fill_in "admin[email]", with: "admin_test@example.com"
    fill_in "admin[password]", with: "password"
    click_on "ログイン"
  end

  context "お知らせ新規作成" do
    it "新規作成を押してお知らせを作成する" do
      visit new_info_path
      fill_in "info[title]", with: "テスト"
      choose "info_viewer_type_both"
      fill_in "info[content]", with: "テスト"
      click_on "送信"
      expect(page).to have_content "お知らせ一覧"
    end
  end

  context "お知らせ詳細" do
    it "お知らせ詳細を見る" do
      FactoryBot.create(:info)
      visit infos_path
      click_on "詳細"
      expect(page).to have_content "お知らせ詳細"
    end
  end

  context "お知らせ編集" do
    it "Adminとしてログインしてお知らせを編集する" do
      info = FactoryBot.create(:info)
      visit edit_info_path(info)
      fill_in "info[title]", with: "更新後のタイトル"
      choose "info_viewer_type_both"
      fill_in "info[content]", with: "更新後の内容"
      click_on "送信"
      expect(page).to have_content "お知らせ一覧"
      expect(page).to have_content "更新後のタイトル"
    end
  end

  context "お知らせ編集アクセス制限" do
    it "一般ユーザーとしてログインしてお知らせを編集することが出来ない" do
      FactoryBot.create(:info)
      visit infos_path
      click_on "詳細"
      expect(page).not_to have_content "編集"
    end
  end
end



