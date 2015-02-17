class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def user_must_have_at_least_one_role
    errors.add(:role, ", at least one is required.") if self.roles.empty?
  end
end