class ProductsController < ApplicationController
  # before_action :set_cart, only: [:search, :show, :create]
  before_action :fetch_items_count
  before_action :user_helper

  def index
    @categories = Category.all.includes(:products)

    cate = params[:cate]
    if !cate.nil?
      @category = Category.find(cate)
      @products = Product.where(category_id: cate).order(:id).page(params[:page])
    else
      @products = Product.order(:id).page(params[:page])
    end
  end

  def show
    set_cart
    @product = Product.find(params[:id])
    @cate = Category.find(@product.category_id)

    @line_item = LineItem.new do |l|
      l.product_id = @product.id
      l.shopping_cart_id = @cart.id
    end
  end

  # GET /search/?search_temr = user + search +terms
  def search
    if params[:category_id].blank?
      @products = Product.where("name LIKE ?", "%#{params[:search_term]}%")
      @cate = nil
    else
      @products = Category.find(params[:category_id]).products.where("name LIKE ?", "%#{params[:search_term]}%")
      @cate = Category.find(params[:category_id])
    end
  end
end
