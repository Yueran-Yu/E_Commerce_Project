class Order < ApplicationRecord
  belongs_to :status
  belongs_to :devise_user
  has_many :order_products
  validates :o_price, numericality: true


end
