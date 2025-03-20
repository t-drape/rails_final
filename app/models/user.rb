class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  :omniauthable, omniauth_providers: [ :github ]

  validates :name, uniqueness: true, presence: true, length: { minimum: 4 }
  validates :email, uniqueness: true, presence: true, length: { minimum: 10 }
  validates :password, length: { in: 8..12 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likings, foreign_key: :user_id, class_name: "LikedPost"
  has_many :liked_posts, through: :likings, source: :post

  # When the user is the Influencer
  has_many :follows, foreign_key: :follower_id
  has_many :influencers, through: :follows, source: :influencer

  has_many :inverse_follows, foreign_key: :influencer_id, class_name: "Follow"
  has_many :followers, through: :inverse_follows, source: :follower

  # has_many :inverse_followships, foreign_key: :followee_id, class_name: "Followship"
  # has_many :followers, through: :inverse_followships, source: :follower
  # has_many :followers, class_name: "Follow", foreign_key: :influencer_id, dependent: :destroy
  # # When the user is the Follower
  # has_many :influencers, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy
  # has_many :follows, foreign_key: :influencer_id
  # has_many :followers, through: :follows
  # has_and_belongs_to_many :followers, through: :users_users



  # def self.from_provider_data(data)
  #   puts data
  #   where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
  #     user.email = provider_data.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     # find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
  #     #   user.email = auth.info.email
  #     #   user.password = Devise.friendly_token[0, 20]
  #     #   # user.name = auth.info.nickname   # assuming the user model has a name
  #     #   # user.image = auth.info.image # assuming the user model has an image
  #     #   # If you are using confirmable and the provider(s) you use validate emails,
  #     #   # uncomment the line below to skip the confirmation emails.
  #     #   user.skip_confirmation!
  #   end
  # end
end
