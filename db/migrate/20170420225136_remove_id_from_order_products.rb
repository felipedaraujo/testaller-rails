class RemoveIdFromOrderProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_products, :id
  end
end
