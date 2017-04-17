class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.references :order, foreign_key: true
      t.references :products, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
