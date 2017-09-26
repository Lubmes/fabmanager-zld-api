class Reservation < ApplicationRecord
  belongs_to :user
  has_many :machine_reservations
  has_many :machines, :through => :machine_reservations
end
