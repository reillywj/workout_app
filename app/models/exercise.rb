class Exercise < ActiveRecord::Base
  belongs_to :category
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises


  validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true

end