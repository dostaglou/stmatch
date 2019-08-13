class Course < ApplicationRecord
  belongs_to :user
  validates :name, :level, :duration, :description, presence: true
end
