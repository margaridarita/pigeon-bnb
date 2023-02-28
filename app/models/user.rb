class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :pigeons, dependent: :destroy
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings

  validates :username, presence: true, length: { maximum: 15 }, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
