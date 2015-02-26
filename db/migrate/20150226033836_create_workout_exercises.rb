class CreateWorkoutExercises < ActiveRecord::Migration
  def change
    create_table :workout_exercises do |t|
      t.integer :workout_id, :exercise_id
      t.timestamps
    end
  end
end
