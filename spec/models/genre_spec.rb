# spec/models/genre_spec.rb
require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'バリデーション' do
    it '名前が存在すれば有効であること' do
      genre = Genre.new(name: 'テスト')
      expect(genre).to be_valid
    end

    it '名前がなければ無効であること' do
      genre = Genre.new(name: nil)
      expect(genre).not_to be_valid
    end
  end
end
