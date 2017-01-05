class Category < ApplicationRecord
  validates :title, presence: true
  has_many :items

  def find_items_associated_with_category
    items.where(@category)
  end
end
