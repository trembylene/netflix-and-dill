class Booking < ApplicationRecord
  # before_create :check_overlapping_date

  belongs_to :user
  belongs_to :plant

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_equal_to_end
  validate :no_overlap
  validate :no_past_bookings
  validate :start_after_end

  def start_equal_to_end
    return unless self.start_date == self.end_date
    errors.add(:end_date, "must be different from start date")
  end

  def start_after_end
    return unless self.start_date > self.end_date
    errors.add(:end_date, "must be after start date")
  end

  def no_overlap
    plant.bookings.each do |booking|
        errors.add(:start_date, "is not available") if booking.dates.include? start_date
        errors.add(:end_date, "is not available") if booking.dates.include? end_date
    end
    return errors.empty?
  end

  def no_past_bookings
    return unless self.start_date < Date.today
    errors.add(:start_date, "must not be in the past")
  end



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
