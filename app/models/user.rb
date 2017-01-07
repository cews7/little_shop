class User < ApplicationRecord
  has_secure_password
  validates :name, :email, :password_digest, presence: true
  validates :password_digest, confirmation: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }, allow_nil: true
end
