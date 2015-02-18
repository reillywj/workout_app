class Goal < ActiveRecord::Base
  belongs_to :goalable, polymorphic: true

  validates :description, presence: true, length: {minimum: 5, maximum: 50}
end