class WorkoutExerciseSet < ActiveRecord::Base
  belongs_to :workout_exercise
  validates :set_number, presence: true
  validates_uniqueness_of :set_number, scope: :workout_exercise_id
end