class CategoriesController < ApplicationController
  before_action :fetch_items_count


  def index
    @categories = Category.order(:id)
  end
end
