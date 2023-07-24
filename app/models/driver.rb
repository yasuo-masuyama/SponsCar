class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  
  has_many :under_deals
  has_many :car_infos
  has_many :transfer_infos

  enum user_status: {not_check: 0, checked_indentification: 1, checked_car_indentification: 2,}
end
