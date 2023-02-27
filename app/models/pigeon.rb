class Pigeon < ApplicationRecord
  belongs_to :user

  validates :name, :description, :available, :price_per_day, presence: true
  validates :name, length: { maximum: 15 }
  validates :description, length: { maximum: 50 }
end
