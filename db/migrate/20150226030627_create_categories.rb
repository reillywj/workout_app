class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :abbreviation
      t.timestamps
    end
    create_table :exercise_categories do |t|
      t.integer :exercise_id, :category_id
      t.timestamps
    end
  end
end
