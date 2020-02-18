class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :species, presence: true
  validates :location, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
