class Sponsor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates_acceptance_of :terms, allow_nil: false, message: "※会員登録には利用規約への同意が必要です。", on: :create
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

end
