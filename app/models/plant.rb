class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
