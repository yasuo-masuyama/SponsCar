class Room < ApplicationRecord
  belongs_to :driver
  belongs_to :sponsor
  belongs_to :advertisement

  has_many :chats
end
