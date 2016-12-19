class CustomersController < ApplicationController

  def index
    @customers = Customer.select('id, name, email, city, pincode').all
  end

  def new
    @customers = Customer.new
  end

  def show
  	@customer_orders = Customer.cutomer_on_id(params[:id]).orders
  end

  def create
    Customer.new(params.require(:customers).permit!).save
    redirect_to customers_path
  end

  def edit
    @customers = Customer.cutomer_on_id(params[:id])
  end

  def update
    Customer.cutomer_on_id(params[:id]).update_attributes(params.require(:customers).permit!)
    redirect_to customers_path
  end

  def destroy
    Customer.cutomer_on_id(params[:id]).destroy
    redirect_to customers_path
  end

end
