require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "アソシエーション" do
    it { should belong_to(:driver) }
    it { should belong_to(:advertisement) }
  end
end
