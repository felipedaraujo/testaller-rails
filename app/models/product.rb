class Product < ApplicationRecord
  belongs_to :company

  has_many :lists
  has_many :orders, :through => :lists

  validates_presence_of :name, :company_id
  validates :name, uniqueness: { scope: [:company_id] }, length: { maximum: 255 }
end
