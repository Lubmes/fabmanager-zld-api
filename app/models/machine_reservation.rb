class MachineReservation < ApplicationRecord
  belongs_to :machine
  belongs_to :reservation
end
