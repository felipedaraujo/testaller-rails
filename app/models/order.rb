class Order < ApplicationRecord
  enum status: [ :in_progress, :delivered, :canceled ]

  has_many :order_products
  has_many :products, :through => :order_products
end
