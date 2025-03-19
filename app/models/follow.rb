class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :influencer, class_name: "User"
end
