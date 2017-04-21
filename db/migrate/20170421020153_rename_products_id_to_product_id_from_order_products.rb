class RenameProductsIdToProductIdFromOrderProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :order_products, :products_id, :product_id
  end
end
