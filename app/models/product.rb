class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  validates :name, presence: true
  validates :price, numericality: true
  has_one_attached :active_image
end
