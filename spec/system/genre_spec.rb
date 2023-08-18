require 'rails_helper'
RSpec.describe "ジャンル機能", type: :system do
  
  before do
    FactoryBot.create(:admin)
    visit new_admin_session_path 
    fill_in "admin[email]", with: "admin_test@example.com"
    fill_in "admin[password]", with: "password"
    click_on "ログイン"
  end

  context "ジャンル新規作成" do
    it "新規作成を押してお知らせを作成する" do
      visit admins_genres_path
      fill_in "genre[name]", with: "テスト"
      click_on "新規登録"
      expect(page).to have_content "テスト"
    end
  end

  context "ジャンル編集" do
    it "ジャンル編集をクリックして編集ができる" do
      genre = FactoryBot.create(:genre)
      visit edit_admins_genre_path(genre)
      fill_in "genre[name]", with: "テスト"
      click_on "登録する"
      expect(page).to have_content "テスト"
    end
  end

  context "ジャンル削除" do
    it "ジャンル削除をクリックして削除ができる" do
      FactoryBot.create(:genre)
      visit admins_genres_path
      click_on "削除する"
      expect(page.accept_confirm).to eq "本当に削除してもよろしいですか？"
      expect(page).to have_content "ジャンル一覧"
    end
  end
end