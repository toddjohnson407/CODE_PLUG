class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses
  has_many :credits
  has_many :bookings
  has_many :messages
  mount_uploader :photo, PhotoUploader

  before_save :set_teacher

  def set_teacher
    if self.description
      self.teacher = true
    end
  end

end
