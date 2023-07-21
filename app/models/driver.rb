class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  has_many :under_deals

  attachment :profile_image
	attachment :license_image

  enum user_status: {not_check: 0, checked_indentification: 1, checked_car_indentification: 2,}
end
