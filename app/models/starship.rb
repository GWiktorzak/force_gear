class Starship < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :cost, presence: true
  validates :crew, presence: true
  validates :passengers, presence: true
  validates :cargo_capacity, presence: true
end
