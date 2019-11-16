class Book < ApplicationRecord

validates :title, presence: true
validates :body, presence: true, length: { maximum: 201 }
validates :user_id, presence: true, uniqueness: true

belongs_to :user

def self
	return User.find_by(id: self.user_id)
end
end
