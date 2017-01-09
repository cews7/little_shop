class User < ApplicationRecord
 has_secure_password
 validates :name, :email, presence: true
 validates :password, confirmation: true
 validates :email, uniqueness: true
 validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

 enum role: %w(default admin)
end
