class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :username, presence: true

  has_many :fabmoments

  def to_s
    username
  end
end
