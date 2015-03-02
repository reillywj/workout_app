class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true
  has_many :subcategories
  has_many :exercises, through: :subcategories
end