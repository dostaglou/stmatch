class Course < ApplicationRecord
  belongs_to :user
  validates :name, :level, :duration, :duration, :description, presence: true
end
