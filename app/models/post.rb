class Post < ApplicationRecord
  validates :title, uniqueness: true, presence: true, length: { minimum: 4 }
  validates :body, presence: true, length: { minimum: 10 }
  belongs_to :user
end
