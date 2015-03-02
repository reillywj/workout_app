class Exercise < ActiveRecord::Base
  belongs_to :subcategory
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises


  validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates_uniqueness_of :name, scope: :subcategory_id

end