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

  # GET /search/?search_temr = user + search +terms
  def search
          @products = if params[:category_id].blank?
                        Product.where("name LIKE ?", "%#{params[:search_term]}%")
                      else
                        Category.find(params[:category_id]).products.where("name LIKE ?", "%#{params[:search_term]}%")
                      end
    @products
  end
end

