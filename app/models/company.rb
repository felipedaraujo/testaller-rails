class Company < ApplicationRecord
  has_many :products, dependent: :destroy

  belongs_to :user

  validates_cnpj_format_of :cnpj
  validates :cnpj,    presence: true, uniqueness: true
  validates :name,    presence: true, length: { maximum: 255 }
  validates :user_id, presence: true



  def append_total_orders
    attributes.merge(total_orders: self.total_orders)
  end

  def total_orders
    # products.joins(:lists).where(company_id: self.id).count
    products.joins(lists: :order).select(:orders).group(:orders).length
  end
end
