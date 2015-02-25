class Cycle < ActiveRecord::Base
  belongs_to :athlete, class_name: "User", foreign_key: "athlete_id"
  has_many :workouts

  validates :description, presence: true, length: {minimum: 4, maximum: 40}
  validate :start_date_end_date_check



  def start_date_end_date_check
    if self.start_date.nil? || self.end_date.nil?
      errors.add(:start_date, "can't be empty.") if self.start_date.nil?
      errors.add(:end_date, "can't be empty.") if self.end_date.nil?
    elsif self.start_date >= self.end_date
      errors.add(:start_date, "must be before end date. We suggest a 4 week minimum workout cycle.")
      self.end_date = self.start_date + 28
    end
  end

  def cycle_length_days
    (self.end_date - self.start_date).to_i
  end

  def cycle_length_weeks
    self.cycle_length_days / 7
  end
end