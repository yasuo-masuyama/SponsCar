class Advertisement < ApplicationRecord
  validates :genre_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :heading, presence: true
  validates :amounts, presence: true
  validates :image, presence: true, blob: { content_type: :image }

  belongs_to :sponsor
  belongs_to :genre

  has_many :rooms
  has_many :under_deals
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def favorited_by?(driver)
		favorites.where(driver_id: driver.id).exists?
	end

end
