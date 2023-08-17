require 'rails_helper'

RSpec.describe DealMessage, type: :model do
  describe "アソシエーション" do
    it { should belong_to(:under_deal) }
  end

  describe "enum" do
    it "user_typeのenum値を持つこと" do
      should define_enum_for(:user_type).
              with_values(driver: 0, sponsor: 1, admin: 3).
              backed_by_column_of_type(:integer)
    end
  end
end

