class Course < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  belongs_to :subject

  validates :title, presence: true
  validates :price, presence: true
  validates :address, presence: true

  def owner
    user
  end

  def students
    users
  end
end
