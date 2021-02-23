class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :starship

  validates :booking_start_date, :booking_end_date, presence: true
end
