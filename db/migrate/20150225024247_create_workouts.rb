class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :cycle_id
      t.text :notes
      t.date :workout_date
      t.timestamps
    end
  end
end
