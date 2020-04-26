class ApplicationController < ActionController::Base
  def user_helper
    if devise_user_signed_in?
      @current_user = current_devise_user
    end
    @current_user
  end

  def fetch_items_count
    if devise_user_signed_in?
      if current_devise_user.shopping_cart.nil?
        @all_items_count = 0
      else
        @all_items_count = current_devise_user.shopping_cart.line_items.sum { |q| q.quantity }
      end
    else
      @all_items_count = 0
    end
    return @all_items_count
  end

  def set_cart
    if devise_user_signed_in?
      if current_devise_user.shopping_cart_id.nil?
        user_id = current_devise_user.id
        @cart = ShoppingCart.create(devise_user_id: user_id)
        current_devise_user.shopping_cart_id = @cart.id
        current_devise_user.save
        puts("######  #{@cart.inspect}")
        puts("######  #{current_devise_user.inspect}")
        puts("######  #{current_devise_user.errors.messages}")
      else
        @cart = current_devise_user.shopping_cart
      end
    else
      @cart = 0
    end
    return @cart
  end

  def get_products_array
    if devise_user_signed_in?
      @items_array = []
      all_i = current_devise_user.shopping_cart.line_items.group(:product_id).sum(:quantity)
      all_i.each do |k, v|
        @items_array << [Product.find(k).name, Product.find(k).price, v, k]
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
