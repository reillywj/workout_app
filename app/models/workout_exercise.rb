class WorkoutExercise < ActiveRecord::Base
  belongs_to :workouts
  belongs_to :exercises
  has_many :workout_exercise_sets

  validates :order, presence: true, uniqueness: {scope: :workout, message: "should be unique to this workout."}
end