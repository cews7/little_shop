class ItemsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @items = @category.find_items_associated_with_category
  end
end
