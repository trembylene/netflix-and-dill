class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings

  CATEGORY = ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"]

  validates :title, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :cost, presence: true
  validates :plant_type, presence: true
  mount_uploader :photo, PhotoUploader
end
