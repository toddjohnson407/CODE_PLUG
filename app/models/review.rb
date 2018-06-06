class Review < ApplicationRecord
  before_destroy :check

  has_many :bookings, dependent: :destroy

  private

  def check
    if self.bookings.any?
      raise ActiveRecord::InvalidForeignKey
    end
  end
end
