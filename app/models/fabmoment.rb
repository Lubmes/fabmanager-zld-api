class Fabmoment < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true

  def to_s
    title
  end
end
