require 'rails_helper'

RSpec.describe RelationshipDriver, type: :model do
  describe "アソシエーション" do
    it { should belong_to(:follower).class_name('Driver') }
    it { should belong_to(:followed).class_name('Sponsor') }
  end

  describe "バリデーション" do
    it { should validate_presence_of(:follower_id) }
    it { should validate_presence_of(:followed_id) }
  end
end
