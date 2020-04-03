class ProductsController < ApplicationController
  def index
    @categories = Category.all

    cate = params[:cate]
    if !cate.nil?
      @products = Product.where(category_id: cate).order(:id).page(params[:page])
    else
      @products = Product.order(:id).page(params[:page])
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
