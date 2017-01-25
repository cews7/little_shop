class Item < ApplicationRecord
  validates :title, :description, :price, :image, :category_id, presence: true
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
end
