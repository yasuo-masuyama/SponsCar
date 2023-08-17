require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "アソシエーション" do
    it { should belong_to(:follower).class_name('Sponsor') }
    it { should belong_to(:followed).class_name('Driver') }
  end

  describe "バリデーション" do
    it { should validate_presence_of(:follower_id) }
    it { should validate_presence_of(:followed_id) }
  end
end
