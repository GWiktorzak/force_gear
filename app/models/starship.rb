class Starship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :description, presence: true
  validates :location, presence: true

  has_one_attached :photo
end
