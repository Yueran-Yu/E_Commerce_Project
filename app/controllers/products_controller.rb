class ProductsController < ApplicationController
  def index
    cate = params[:cate]
    @categories = Category.all
    if !cate.nil?
      @products = Product.where(category_id: cate)
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
