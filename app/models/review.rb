class Review < ApplicationRecord
  before_destroy :check

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  private

  def check
    if self.bookings.any?
      raise ActiveRecord::InvalidForeignKey
    end
  end
end
