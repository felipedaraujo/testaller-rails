class Product < ApplicationRecord
  belongs_to :company

  has_many :order_products
  has_many :orders, :through => :order_products

  validates_presence_of :name, :company_id
  validates :name, uniqueness: { scope: [:company_id] }, length: { maximum: 255 }
end
