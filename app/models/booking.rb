class Booking < ApplicationRecord
  belongs_to :pigeon
  belongs_to :user

  scope :before_today, -> { where(start_date: ..Date.today) }
  scope :after_today, -> { where(start_date: Date.today..) }

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :no_overlap

  def total_price_calc
    ((end_date - start_date) / 60 / 60 / 24) * pigeon.price_per_day
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end

  def no_overlap
    overlapping_bookings = pigeon.bookings
      .where.not(id: id)
      .where("(? BETWEEN start_date AND end_date) OR (? BETWEEN start_date AND end_date) OR (start_date BETWEEN ? AND ?) OR (end_date BETWEEN ? AND ?)", start_date, end_date, start_date, end_date, start_date, end_date)

    if overlapping_bookings.any?
      errors.add(:base, "Selected dates are already booked")
    end
end
end
