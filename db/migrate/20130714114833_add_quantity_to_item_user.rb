class AddQuantityToItemUser < ActiveRecord::Migration
  def change
    add_column :item_users, :quantity, :integer, default: 1
  end
end
