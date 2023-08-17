require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe ".guest" do
    let!(:guest_admin) { create(:admin, email: 'admin1@example.com', password: 'password') }

    it "ゲスト管理者を返すこと" do
      expect(Admin.guest).to eq guest_admin
    end

    context "ゲスト管理者が存在しない場合" do
      before do
        guest_admin.destroy
      end

      it "エラーを発生させること" do
        expect { Admin.guest }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
