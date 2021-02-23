class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :starship

  validates :booking_start_date, :booking_end_date, presence: true
  # validates :booking_start_date, :booking_end_date, uniqueness: { scope: :starship, message: "This starship is already booked for these dates"}
  validate :end_date_after_start_date
  validate :start_date_end_date_conflict

  private

  def end_date_after_start_date
    return if booking_end_date.blank? || booking_start_date.blank?
    if booking_end_date < booking_start_date
      errors.add(:booking_end_date, "Must be after the start date")
    end
  end

  def start_date_end_date_conflict
    return if booking_end_date.blank? || booking_start_date.blank?
    time = []
    Booking.where(starship: starship_id).each do |booking|
      time << booking.booking_start_date
      time << booking.booking_end_date
    end
    if time.include? booking_start_date
      errors.add(:booking_start_date, "This starship is already booked on these dates")
    elsif time.include? booking_end_date
      errors.add(:booking_end_date, "This starship is already booked on these dates")
    end
  end
end
