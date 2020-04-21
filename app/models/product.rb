class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  validates :name, :price, :is_in_stock, :description, :category_id, presence: true
  validates :price, numericality: true
  has_one_attached :active_image
  validates :discount_rate, presence: false
  paginates_per 9

end
