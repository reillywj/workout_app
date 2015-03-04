class AddWorkunitsAndRepunitsToSets < ActiveRecord::Migration
  def change
    add_column :workout_exercise_sets, :work_units, :string
    add_column :workout_exercise_sets, :rep_units, :string
    add_column :workout_exercise_sets, :relative_perceived_exertion, :string
  end
end
