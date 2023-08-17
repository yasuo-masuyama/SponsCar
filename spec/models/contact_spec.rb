# spec/models/contact_spec.rb
require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'バリデーション' do
    it 'すべての属性が存在すれば有効であること' do
      contact = Contact.new(name: 'test', email: 'test@example.com', content: 'お問い合わせ内容', telephone_number: '070-1111-2222', work_status: 'new_inquiry')
      expect(contact).to be_valid
    end

    it '名前がなければ無効であること' do
      contact = Contact.new(name: nil)
      expect(contact).not_to be_valid
    end

    it 'メールがなければ無効であること' do
      contact = Contact.new(email: nil)
      expect(contact).not_to be_valid
    end

    it 'メールが255文字を超える場合は無効であること' do
      contact = Contact.new(email: 'a' * 256 + '@example.com')
      expect(contact).not_to be_valid
    end

    it '内容がなければ無効であること' do
      contact = Contact.new(content: nil)
      expect(contact).not_to be_valid
    end

    it '電話番号がなければ無効であること' do
      contact = Contact.new(telephone_number: nil)
      expect(contact).not_to be_valid
    end
  end

  describe 'enumの確認' do
    it 'work_statusがnew_inquiryに選択することができる' do
      contact = Contact.new(work_status: 'new_inquiry')
      expect(contact.new_inquiry?).to be true
    end

    it 'work_statusがworking_inquiryに選択することができる' do
      contact = Contact.new(work_status: 'working_inquiry')
      expect(contact.working_inquiry?).to be true
    end

    it 'work_statusがpast_inquiryに選択することができる' do
      contact = Contact.new(work_status: 'past_inquiry')
      expect(contact.past_inquiry?).to be true
    end
  end
end
