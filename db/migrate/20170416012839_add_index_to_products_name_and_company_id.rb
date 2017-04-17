class AddIndexToProductsNameAndCompanyId < ActiveRecord::Migration[5.0]
  def change
    add_index :products, [:name, :company_id], unique: true
  end
end
