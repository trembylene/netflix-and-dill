class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :plants

  validates :start_date, presence: true
  validates :end_date, presence: true
end
