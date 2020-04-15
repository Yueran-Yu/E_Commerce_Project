class ProductsController < ApplicationController
  before_action :authenticate_devise_user!

  def index
    @categories = Category.all.includes(:products)

    cate = params[:cate]
    if !cate.nil?
      @category  = Category.find(cate)
      @products = Product.where(category_id: cate).order(:id).page(params[:page])
    else
      @products = Product.order(:id).page(params[:page])
    end

  end

  def show
    @product = Product.find(params[:id])
    @cate = Category.find(@product.category_id)

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

