require 'rails_helper'

RSpec.describe TransferInfo, type: :model do
  let(:driver) { create(:driver) }

  describe 'バリデーション' do
    it 'すべての属性が存在すれば有効であること' do
      transfer_info = TransferInfo.new(bank_name: 'テスト銀行', branch_name: 'テスト支店', account_type: 'ordinary', account_number: '1234567', account_name: 'テスト', driver: driver)
      expect(transfer_info).to be_valid
    end

    it '銀行名がなければ無効であること' do
      transfer_info = TransferInfo.new(bank_name: nil, driver: driver)
      expect(transfer_info).not_to be_valid
    end

    it '支店名がなければ無効であること' do
      transfer_info = TransferInfo.new(branch_name: nil, driver: driver)
      expect(transfer_info).not_to be_valid
    end

    it '口座の種類がなければ無効であること' do
      transfer_info = TransferInfo.new(account_type: nil, driver: driver)
      expect(transfer_info).not_to be_valid
    end

    it '口座番号が5桁未満であれば無効であること' do
      transfer_info = TransferInfo.new(account_number: '1234', driver: driver)
      expect(transfer_info).not_to be_valid
    end

    it '口座番号が10桁以上であれば無効であること' do
      transfer_info = TransferInfo.new(account_number: '1234567890', driver: driver)
      expect(transfer_info).not_to be_valid
    end

    it '口座番号が数字以外を含む場合無効であること' do
      transfer_info = TransferInfo.new(account_number: '12345a', driver: driver)
      expect(transfer_info).not_to be_valid
    end

    it '口座名義がカタカナ以外であれば無効であること' do
      transfer_info = TransferInfo.new(account_name: 'yamada', driver: driver)
      expect(transfer_info).not_to be_valid
    end
  end

  describe 'enumの確認' do
    it 'account_typeがordinaryであることができる' do
      transfer_info = TransferInfo.new(account_type: 'ordinary', driver: driver)
      expect(transfer_info.ordinary?).to be true
    end

    it 'account_typeがcheckingであることができる' do
      transfer_info = TransferInfo.new(account_type: 'checking', driver: driver)
      expect(transfer_info.checking?).to be true
    end
  end

  describe 'full_infoメソッドの確認' do
    let(:transfer_info) { TransferInfo.new(bank_name: 'テスト銀行', branch_name: 'テスト支店', account_type: 'ordinary', account_number: '1234567', account_name: 'テスト', driver: driver) }

    it 'full_infoが正しい情報を返すこと' do
      expect(transfer_info.full_info).to eq 'テスト銀行テスト支店普通預金1234567テスト'
    end
  end
end
