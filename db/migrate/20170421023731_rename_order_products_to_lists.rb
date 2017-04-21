class RenameOrderProductsToLists < ActiveRecord::Migration[5.0]
  def change
    rename_table :order_products, :lists
  end
end
