class ApplicationController < ActionController::Base
  def user_helper
    if devise_user_signed_in?
      @current_user = current_devise_user
    end
    @current_user
  end

  def fetch_items_count
    if ShoppingCart.first.nil?
      @all_items_count = 0
    else
      @all_items_count = ShoppingCart.first.line_items.sum { |q| q.quantity }
    end
  end

  def set_cart
    @cart = ShoppingCart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    if devise_user_signed_in?
      user_id = current_devise_user.id
      @cart = ShoppingCart.create(devise_user_id: user_id)
      current_devise_user.shopping_cart_id = @cart.id
      current_devise_user.save
      puts("######  #{@cart.inspect}")
      puts("######  #{current_devise_user.inspect}")
      puts("######  #{current_devise_user.errors.messages}")
      session[:cart_id] = @cart.id
    end
    return @cart
  end

  def get_products_array
    if devise_user_signed_in?
      @items_array = []
      all_items = @current_devise_user.shopping_cart.line_items
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
    else
      @items_array = 0
    end
    return @items_array
  end

  def date_card
    @date = Time.zone.today
  end
end
