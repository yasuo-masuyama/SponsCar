class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :telephone_number, presence: true

  enum work_status: { new_inquiry: 0, working_inquiry: 1, past_inquiry: 2 }
end
