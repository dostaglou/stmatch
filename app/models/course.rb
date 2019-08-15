class Course < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, :level, :duration, :description, presence: true
end
