class AddInfoToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :info, foreign_key: true
  end
end
