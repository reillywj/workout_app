class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, through: :user_roles
  accepts_nested_attributes_for :roles
  has_many :cycles, foreign_key: "athlete_id"
  has_many :goals, as: :goalable
  has_many :workouts, through: :cycles

  validates :email, uniqueness: true, presence: true, case_sensitive: false
  validates :name, presence: true

  def user_must_have_at_least_one_role
    errors.add(:role, ", at least one is required.") if self.roles.empty?
  end
end