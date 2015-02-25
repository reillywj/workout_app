class AddVisibilityAndStatusToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :visibility, :boolean
    add_column :goals, :status, :string
  end
end
