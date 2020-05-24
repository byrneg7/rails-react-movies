
class Chatroom < ApplicationRecord
  validates :name, :members, presence: true
end
