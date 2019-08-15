class Course < ApplicationRecord
  belongs_to :user
  validates :name, :level, :duration, :description, :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :reviews
  validates :name, :level, :duration, :description, presence: true

end
