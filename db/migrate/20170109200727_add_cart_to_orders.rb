class AddCartToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cart, :hstore
  end
end
