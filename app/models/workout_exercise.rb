class WorkoutExercise < ActiveRecord::Base
  belongs_to :workouts
  belongs_to :exercises
  has_many :workout_exercise_sets

  validates :order, presence: true
  validates_uniqueness_of :order, scope: :workout, case_sensitive: false
end