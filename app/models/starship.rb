class Starship < ApplicationRecord
  LOCATION = %w[London Birmingham Manchester Bristol Liverpool Nottingham Cardiff Newcastle]
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :description, presence: true
  validates :location, presence: true, inclusion: { in: LOCATION }

  has_one_attached :photo
end
