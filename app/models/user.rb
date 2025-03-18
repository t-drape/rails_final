class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  :omniauthable, omniauth_providers: [ :github ]

  validates :name, uniqueness: true, presence: true, length: { minimum: 4 }
  validates :email, uniqueness: true, presence: true, length: { minimum: 10 }
  validates :password, length: { in: 8..12 }

  has_many :posts

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
