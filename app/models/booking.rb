class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :review, optional: true
end
