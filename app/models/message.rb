class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, :room_id, :user_id, presence: true
end
