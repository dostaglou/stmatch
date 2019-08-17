class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_one :teacher, through: :course, source: :user
  has_one :course_level, through: :course, source: :level
  has_one :course_duration, through: :course, source: :duration
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :user, :course, :date, :status, presence: true

 
  include PgSearch
  pg_search_scope :global_search,
    against: [ :status, :location, :date ],
    associated_against: {
      course: [ :name, :description, :location, :price ],
      teacher: [ :last_name, :first_name],
      course_level: [:name],
      course_duration: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
