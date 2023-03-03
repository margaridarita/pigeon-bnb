class Booking < ApplicationRecord
  belongs_to :pigeon
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :start_date_must_be_after_today
  validate :no_overlap

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

  def start_date_must_be_after_today
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "must be after today's date")
    end
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
