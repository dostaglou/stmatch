class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course
  
  validates :user, :course, :date, :location, :status, presence: true
  include PgSearch
  pg_search_scope :global_search,
    against: [ :status, :location, :date ],
    associated_against: {
      course: [ :name, :level, :description, :duration, :location, :price ],
      user: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }
end