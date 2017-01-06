class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

end
