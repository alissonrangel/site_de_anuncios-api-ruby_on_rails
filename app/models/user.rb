class User < ApplicationRecord
  has_secure_password

  has_one :state
  has_many :ads
  # has_one :booking_time
  # def has_booked_time?
  #   booking_time.present?
  # end
end