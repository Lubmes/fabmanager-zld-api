class Machine < ApplicationRecord
  has_one :usage
  has_one :machine_occupation
  has_many :machine_reservations
end
