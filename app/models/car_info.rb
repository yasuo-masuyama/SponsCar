class CarInfo < ApplicationRecord
  validates :manufacturer_name, presence: true
  validates :name, presence: true
  validates :flame_number, presence: true
  validates :license_plate, presence: true
  validates :vehicle_image, presence: true, blob: { content_type: :image }

  belongs_to :driver
  has_one_attached :vehicle_image
end
