class Driver < ApplicationRecord
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :terms, acceptance: { allow_nil: false, message: "※会員登録には利用規約への同意が必要です。", on: :create }
  validates :name, presence: true
  validates :name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :email, presence: true, length: { maximum: 250 }

  has_one_attached :profile_image
  has_one_attached :license_image

  has_many :rooms
  has_many :under_deals
  has_many :car_infos
  has_many :transfer_infos
  has_many :favorites, dependent: :destroy

  enum user_status: {not_check: 0, checked_indentification: 1, checked_car_indentification: 2,}

  has_many :follower, class_name: "RelationshipDriver", foreign_key: "follower_id", dependent: :destroy
	has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following_sponsor, through: :follower, source: :followed
  has_many :follower_sponsor, through: :followed, source: :follower

  def follow(sponsor_id)
		follower.create(followed_id: sponsor_id)
	end

	def unfollow(sponsor_id)
		follower.find_by(followed_id: sponsor_id).destroy
	end

	def following(sponsor_id)
		follower.find_by(followed_id: sponsor_id)
	end

  geocoded_by :address
	after_validation :geocode, if: :address_changed?

  def self.guest
		find_by!( email: 'driver1@example.com')
	end
end
