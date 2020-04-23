class ApplicationController < ActionController::Base

  def fetch_home_data
    @shopping_carts_count = ShoppingCart.count
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
end
