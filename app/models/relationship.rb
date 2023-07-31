class Relationship < ApplicationRecord
  validates :follower_id,presence: true
	validates :followed_id,presence: true

  belongs_to :follower, class_name: "Sponsor"
	belongs_to :followed, class_name: "Driver"
end
