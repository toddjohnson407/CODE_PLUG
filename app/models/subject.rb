class Subject < ApplicationRecord
  before_destroy :check

  has_many :courses, dependent: :destroy
  validates :category, presence: true, uniqueness: true

  private

  def check
    if self.courses.any?
      raise ActiveRecord::InvalidForeignKey
    end
  end
end
