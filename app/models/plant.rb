class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORY = ["Cactus", "Succulent", "Fern", "Tree", "Bush", "Flower", "Herb", "Bonsai", "Other"]

  validates :title, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :cost, presence: true
  validates :plant_type, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader

  def self.search(search)
    where("title ILIKE ? OR description ILIKE ? OR care ILIKE ? OR plant_type ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
