class Usage < ApplicationRecord
  belongs_to :machine

  def availability
    capacity - in_use
  end
end
