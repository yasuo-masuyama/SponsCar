require 'rails_helper'

RSpec.describe DealDetail, type: :model do
  describe "アソシエーション" do
    it { should belong_to(:under_deal) }
  end

  describe "口座種別" do
    it "口座種別はordinaryを0として定義する" do
      deal_detail = create(:deal_detail, account_type: :ordinary)
      expect(deal_detail.ordinary?).to be_truthy
    end

    it "口座種別はcheckingを1として定義する" do
      deal_detail = create(:deal_detail, account_type: :checking)
      expect(deal_detail.checking?).to be_truthy
    end
  end

  describe "入金ステータス" do
    it "入金ステータスはnot_transferを0として定義する" do
      deal_detail = create(:deal_detail, transfer_status: :not_transfer)
      expect(deal_detail.not_transfer?).to be_truthy
    end

    it "入金ステータスはtransferredを1として定義する" do
      deal_detail = create(:deal_detail, transfer_status: :transferred)
      expect(deal_detail.transferred?).to be_truthy
    end

    it "入金ステータスはcheckedを2として定義する" do
      deal_detail = create(:deal_detail, transfer_status: :checked)
      expect(deal_detail.checked?).to be_truthy
    end
  end
end
