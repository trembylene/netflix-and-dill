class Booking < ApplicationRecord
  # before_create :check_overlapping_date

  belongs_to :user
  belongs_to :plant

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_equal_to_end
  validate :no_overlap

  def start_equal_to_end
    return unless self.start_date == self.end_date
    errors.add(:end_date, "must be different from start date")
  end

  def no_overlap
    plant.bookings.each do |booking|
        errors.add(:start_date, "is not available") if booking.dates.include? start_date
        errors.add(:end_date, "is not available") if booking.dates.include? end_date
    end
    return errors.empty?
  end

  # def check_overlapping_dates(booking_params)
  #   raise
  #   Booking.where(plant:@plant).any? do |booking|
  #     return true if (@booking.start_date..@booking.end_date).overlaps?(booking.start_date..booking.end_date)
  #   end
  # end

  def start_time
    self.start_date
  end

  def end_time
    self.end_date - 1
  end

  def dates
    self.start_date..self.end_date
  end

end
