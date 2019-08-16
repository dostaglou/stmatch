class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :courses
  # The below gives us access to the bookings of users
  has_many :bookings
  has_many :reviews, through: :courses
  has_many :bookings_as_teacher, through: :courses, source: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
end
