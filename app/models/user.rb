class User < ApplicationRecord
  has_secure_password
  validates :name, :email, :password_digest, presence: true
  validates :password_digest, confirmation: true, length: { minimum: 6 }, allow_nil: true
  validates :email, uniqueness: true
end
