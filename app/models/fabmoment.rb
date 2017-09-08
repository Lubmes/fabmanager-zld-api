class Fabmoment < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  def to_s
    title
  end
end
