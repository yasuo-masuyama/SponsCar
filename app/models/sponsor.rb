class Sponsor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :terms, acceptance: { allow_nil: false, message: "※会員登録には利用規約への同意が必要です。", on: :create }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :company_name, presence: true
	validates :company_name_kana, presence: true,
                    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :ceo_name, presence: true
	validates :ceo_name_kana, presence: true,
                    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
	validates :postal_code, presence: true
	validates :address, presence: true
	validates :telephone_number, presence: true
  validates :registry_image, presence: true, blob: { content_type: :image }

  has_one_attached :company_image
  has_one_attached :registry_image

  has_many :advertisements
  has_many :rooms

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
	has_many :followed, class_name: "RelationshipDriver", foreign_key: "followed_id", dependent: :destroy

  has_many :following_driver, through: :follower, source: :followed
	has_many :follower_driver, through: :followed, source: :follower

  def follow(driver_id)
		follower.create(followed_id: driver_id)
	end

	def unfollow(driver_id)
		follower.find_by(followed_id: driver_id).destroy
	end

	def following(driver_id)
		follower.find_by(followed_id: driver_id)
	end

  geocoded_by :address
	after_validation :geocode, if: :address_changed?

  def self.guest
		Sponsor.find_by!( email: 'sponsor1@example.com')
	end
end
