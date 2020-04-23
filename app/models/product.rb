class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :line_items
  validates :name, :price, :is_in_stock, :description, :category_id, presence: true
  validates :price, numericality: true
  has_one_attached :active_image
  validates :discount_rate, presence: false
  paginates_per 9

  before_destroy :ensure_not_referenced_by_any_line_item

  private
  #ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
