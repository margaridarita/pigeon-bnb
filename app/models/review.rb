class Review < ApplicationRecord
  belongs_to :pigeon
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }
  validates :pigeon, presence: true
end
