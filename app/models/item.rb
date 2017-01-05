class Item < ApplicationRecord
  validates :title, :description, :price, :image, :category_id, presence: true
  belongs_to :category

  def find_items_associated_with_category
    Item.where()
  end
end
