class DropExerciseCategories < ActiveRecord::Migration
  def change
    drop_table :exercise_categories
  end
end
