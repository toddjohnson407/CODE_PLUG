class Course < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  belongs_to :subject

  def owner
    user
  end

  def students
    users
  end
end
