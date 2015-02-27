class CreateWorkoutExerciseSets < ActiveRecord::Migration
  def change
    create_table :workout_exercise_sets do |t|
      t.integer :set_number, :reps_to_do, :reps_completed, :amount_to_do, :amount_completed, :workout_exercise_id
      t.timestamps
    end

    add_column :workout_exercises, :order, :string
  end
end
