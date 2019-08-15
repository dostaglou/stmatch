class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course
  
  validates :user, :course, :date, :location, :status, presence: true
end
