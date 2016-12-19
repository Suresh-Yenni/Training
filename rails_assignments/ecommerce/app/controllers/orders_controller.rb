class OrdersController < ApplicationController

  def home
  end

  def index
    @orders = Order.includes(:customer, :item)
  end

  def new
    @orders = Order.new
  end

  def create
    Order.new(params.require(:orders).permit!).save
    redirect_to orders_home_path
  end

  def destroy
    orders = Order.find(params[:id])
    cust_id = orders.customer_id
    orders.destroy
    redirect_to customer_path(cust_id)
  end


end
