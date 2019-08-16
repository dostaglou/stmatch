class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_location?
  validates :user, :course, :date, :location, :status, presence: true
end
