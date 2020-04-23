class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart
  validates :quantity, :product_id, :shopping_cart_id, presence: true


end
