class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name, :nickname
      t.timestamps
    end
  end
end
