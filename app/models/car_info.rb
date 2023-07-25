class CarInfo < ApplicationRecord
  validates :vehicle_image, presence: true, blob: { content_type: :image }

  belongs_to :driver
  has_one_attached :vehicle_image
end
