class ChangeCategoriesToSubcategoriesInExercises < ActiveRecord::Migration
  def change
    rename_column :exercises, :category_id, :subcategory_id
  end
end
