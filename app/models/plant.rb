class Plant < ApplicationRecord
  belongs_to :users
  has_many :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
