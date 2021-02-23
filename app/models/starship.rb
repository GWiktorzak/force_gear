class Starship < ApplicationRecord
  LOCATION = %w[London Birmingham Manchester Bristol Liverpool Nottingham Cardiff Newcastle]
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :cost, presence: true
  validates :crew, presence: true
  validates :passengers, presence: true
  validates :cargo_capacity, presence: true
  validates :location, presence: true, inclusion: { in: LOCATION }
end
