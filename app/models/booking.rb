class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_one :teacher, through: :course, source: :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :user, :course, :date, :location, :status, presence: true
  include PgSearch
  pg_search_scope :global_search,
    against: [ :status, :location, :date ],
    associated_against: {
      course: [ :name, :level, :description, :duration, :location, :price ], 
      teacher: [ :last_name, :first_name]
    },
    using: {
      tsearch: { prefix: true }
    }
end