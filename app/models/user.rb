class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter2]

  validates :name, uniqueness: true, presence: true, length: { minimum: 4 }
  validates :email, uniqueness: true, presence: true, length: { minimum: 10 }
  validates :password, length: { in: 8..12 }
end
