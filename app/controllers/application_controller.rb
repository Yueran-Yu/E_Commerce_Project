class ApplicationController < ActionController::Base
  def user_helper
    if devise_user_signed_in?
      @current_user = current_devise_user
    end
    @current_user
  end

  def fetch_items_count
    unless ShoppingCart.first.nil?
      @all_items_count = ShoppingCart.first.line_items.sum { |q| q.quantity }
    end
  end

  def set_cart
    @cart = ShoppingCart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    if devise_user_signed_in?
      user_id = current_devise_user.id
      @cart = ShoppingCart.create(devise_user_id: user_id)
      session[:cart_id] = @cart.id
    end
  end

  def get_products_array
    @items_array = []
    all_items = ShoppingCart.first.line_items

    # find the unique product
    all_items.group(:product_id).each do |outside|
      total_quantity_each_product = 0
      all_items.each do |inside|
        if outside.product.id == inside.product.id
          total_quantity_each_product += inside.quantity
        end
      end
      @items_array << [outside.product.name, outside.product.price, total_quantity_each_product, outside.product.id]
    end
    @items_array
  end

  def date_card
    @date = Time.zone.today
  end
end
