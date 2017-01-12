class Info < ApplicationRecord
  has_many :orders
  validates :name, :address, :city, :state, :postal_code, :country, presence: true

end
