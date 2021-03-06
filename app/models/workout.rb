class Workout < ActiveRecord::Base
  belongs_to :cycle
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  has_many :workout_exercise_sets, through: :workout_exercises

  accepts_nested_attributes_for :workout_exercises, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :workout_exercise_sets
  
  validates :workout_date, presence: true
  validate :validate_date_within_cycle

  def validate_date_within_cycle
    cycle = self.cycle
    unless (self.workout_date >= cycle.start_date) && (self.workout_date <= cycle.end_date)
      errors.add(:workout_date, "must fall within its cycle's start (#{self.cycle.start_date}) and end dates (#{self.cycle.end_date})")
    end
  end

  def week_in_cycle
    (self.workout_date - self.cycle.start_date).to_i / 7 + 1
  end

  def athlete
    self.cycle.athlete
  end
end