class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity, default: 1
      t.integer :price
      t.timestamps
    end
  end
end
