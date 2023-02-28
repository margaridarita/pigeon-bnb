class Pigeon < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :description, :price_per_day, presence: true
  validates :name, length: { maximum: 15 }
  validates :description, length: { maximum: 250 }
  validates :price_per_day, numericality: { greater_than_or_equal_to: 1 }
end
