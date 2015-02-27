class WorkoutExerciseSet < ActiveRecord::Base
  belongs_to :workout_exercise
  validates :set_number, uniqueness: {scope: :workout_exercise_id, message: "set number must be unique to the exercise"}

end