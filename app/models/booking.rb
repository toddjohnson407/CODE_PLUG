class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :reviews, dependent: :destroy
end
