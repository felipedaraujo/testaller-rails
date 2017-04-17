class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
