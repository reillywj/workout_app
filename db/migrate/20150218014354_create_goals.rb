class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description, :goalable_type
      t.integer :goalable_id
      t.timestamps
    end
  end
end
