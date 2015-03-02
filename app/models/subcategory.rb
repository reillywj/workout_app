class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :exercises

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :category_id
end