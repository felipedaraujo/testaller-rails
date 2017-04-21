class Order < ApplicationRecord
  enum status: [ :in_progress, :delivered, :canceled ]

  belongs_to :user

  has_many :lists
  has_many :products, :through => :lists

  scope :cnpj, -> (cnpj) { joins(lists: { product: :company }).where(companies: {cnpj: cnpj})}

  def append_products
    attributes.merge(products: self.products)
  end

  def products
    lists.joins(:product).select(:name, :quantity)
  end

  def create_products(products)
    products.each do |product|
      self.lists.create!(
        :product_id => product[:id], :quantity => product[:quantity]
      )
    end
  end
end
