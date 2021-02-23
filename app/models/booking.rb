class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :starship

  validates :booking_start_date, :booking_end_date, presence: true
  validates :booking_start_date, :booking_end_date, uniqueness: { scope: :starship, message: "This starship is already booked for these dates"}
end
