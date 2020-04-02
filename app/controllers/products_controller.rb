class ProductsController < ApplicationController
  def index
    @categories = Category.all

    cate = params[:cate]
    if !cate.nil?
      @products = Product.where(category_id: cate)
    else
      @products = Product.where(category_id: 1)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
