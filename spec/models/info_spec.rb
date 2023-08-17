# spec/models/info_spec.rb
require 'rails_helper'

RSpec.describe Info, type: :model do
  describe 'バリデーション' do
    it '有効な属性であれば有効であること' do
      info = Info.new(title: 'テスト', content: 'テスト', viewer_type: 'both')
      expect(info).to be_valid
    end

    it 'タイトルがなければ無効であること' do
      info = Info.new(title: nil, content: 'テスト', viewer_type: 'both')
      expect(info).not_to be_valid
    end

    it 'コンテンツがなければ無効であること' do
      info = Info.new(title: 'テスト', content: nil, viewer_type: 'both')
      expect(info).not_to be_valid
    end

    it 'viewer_typeがなければ無効であること' do
      info = Info.new(title: 'テスト', content: 'テスト', viewer_type: nil)
      expect(info).not_to be_valid
    end
  end

  describe 'enumの確認' do
    it 'viewer_typeがbothであることができる' do
      info = Info.new(title: 'テスト', content: 'テスト', viewer_type: 'both')
      expect(info.both?).to be true
    end

    it 'viewer_typeがsponsorであることができる' do
      info = Info.new(title: 'テスト', content: 'テスト', viewer_type: 'sponsor')
      expect(info.sponsor?).to be true
    end

    it 'viewer_typeがdriverであることができる' do
      info = Info.new(title: 'テスト', content: 'テスト', viewer_type: 'driver')
      expect(info.driver?).to be true
    end
  end
end
