class ShoppingCartsController < ApplicationController
  before_action :set_cart, only: [:index, :show, :create]
  before_action :get_products_array
  before_action :date_card
  before_action :fetch_items_count

  # GET /carts
  # GET /carts.json
  def index
    set_cart
    get_products_array
  end

  def show
    set_cart
    get_products_array
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = ShoppingCart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    if @cart.id == session[:cart_id]
      session[:cart_id] = nil
    end

    respond_to do |format|
      format.html { redirect_to store_index_url, notice: "Your cart is currently empty" }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart#{params[:id]}"
    redirect_to store_index_url, notice: "Invalid cart"
  end
end
