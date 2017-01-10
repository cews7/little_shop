class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references(:item)
      t.references(:order)
    end
  end
end
