class AddressesController < ApplicationController
  before_action :fetch_items_count
  before_action :user_helper

  def new
    @address = Address.new
    @address.devise_user_id = @current_user.id
    @provinces = Province.all
  end

  def index
    @addresses = @current_user.addresses.all
  end

  def create
    user_helper

    @address = Address.new do |a|
      a.devise_user_id = @current_user.id
      a.country = params[:address][:country]
      a.full_name = params[:address][:full_name]
      a.street_number = params[:address][:street_number]
      a.apartment_number = params[:address][:apartment_number]
      a.city = params[:address][:city]
      a.province_id = params[:province_id]
      puts ("#####  #{params[:province_id]} #{a.province_id}  ")

      a.postcode = params[:address][:postcode]
      a.phone_number = params[:address][:phone_number]
    end

    puts ("#####  #{@address.inspect}")
    if @address.save
      redirect_to addresses_path
    end
  end

  def show
  end

  def destroy
    @address = Address.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to addresses_url, notice: "Address was successfully Removed." }
      format.json { head :no_content }
    end
  end
end
