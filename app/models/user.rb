class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :username, presence: true

  has_many :fabmoments
  # has_many :comments, as: :author

  def to_s
    username
  end
end
