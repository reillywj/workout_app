class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.string :description
      t.integer :athlete_id
      t.date :start_date, :end_date
      t.timestamps
    end
  end
end
