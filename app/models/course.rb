class Course < ApplicationRecord
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :reviews
  validates :name, :level_list, :duration_list, :description, presence: true
  has_many :bookings

  include PgSearch
  multisearchable against: [ :name, :level, :description ]

  acts_as_taggable_on :level, :duration

  $level = ["Beginner", "Intermediate", "Advanced", "Native"]
  $duration = [20, 40, 60, 80, 100, 120, 140, 160, 180]
end
