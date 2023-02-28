class Booking < ApplicationRecord
  belongs_to :pigeon
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def total_price_calc
    ((end_date - start_date) / 60 / 60 / 24) * pigeon.price_per_day
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
