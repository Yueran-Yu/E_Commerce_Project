class Order < ApplicationRecord
  belongs_to :status
  has_many :order_products
  validates :o_price, numericality: true


end
