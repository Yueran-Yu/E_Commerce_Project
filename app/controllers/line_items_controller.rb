class LineItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :fetch_items_count

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    #this is a local variable
    # product = Product.find(params[:product_id])
    set_cart
    @line_item = @cart.line_items.build(product_id: params[:line_item][:product_id], quantity: params[:line_item][:quantity])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.shopping_cart, notice: "Line item was successfully created." }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @items = @cart.line_items.where(product_id: params[:id]).destroy_all

    respond_to do |format|
      format.html { redirect_to shopping_carts_url, notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
  end

  # Only allow a list of trusted parameters through.
  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
