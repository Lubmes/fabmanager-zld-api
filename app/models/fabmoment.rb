class Fabmoment < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :comments

  has_many :controles
  has_many :handles
  has_many :feeds
  has_one :abidance

  has_many :programs, through: :controles
  has_many :machines, through: :handles
  has_many :materials, through: :feeds
  has_one :license, through: :abidance

  validates :title, presence: true

  def to_s
    title
  end
end
