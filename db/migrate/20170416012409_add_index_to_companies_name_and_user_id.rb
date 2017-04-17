class AddIndexToCompaniesNameAndUserId < ActiveRecord::Migration[5.0]
  def change
    add_index :companies, [:name, :user_id], unique: true
  end
end
