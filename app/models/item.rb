class Item < ApplicationRecord
  validates :title, :description, :price, :image, :category_id, presence: true
  belongs_to :category
end
