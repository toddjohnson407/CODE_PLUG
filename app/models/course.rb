class Course < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  belongs_to :subject

  validates :title, presence: true
  validates :price, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_city_and_address,
    against: [ :description, :title ],
    using: {
      tsearch: { prefix: true }
    }

  def owner
    user
  end

  def students
    users
  end
end
