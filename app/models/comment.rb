class Comment < ApplicationRecord
  validates :body, length: { minimum: 1 }
  belongs_to :user
  belongs_to :post
end
