class Advertisement < ApplicationRecord
  validates :genre_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :heading, presence: true
  validates :amounts, presence: true
  validates :image, presence: true, blob: { content_type: :image }

  belongs_to :genre
  belongs_to :sponsor

  has_one_attached :image

end
