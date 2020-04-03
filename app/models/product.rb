class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  validates :name, :is_in_stock,:image, presence: true
  validates :price, numericality: true
  has_one_attached :active_image

  validates :description, :discount_rate, presence: false
  paginates_per 10

end
