class Company < ApplicationRecord
  has_many :products, dependent: :destroy

  belongs_to :user

  validates_cnpj_format_of :cnpj
  validates :cnpj,    presence: true, uniqueness: true
  validates :name,    presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
