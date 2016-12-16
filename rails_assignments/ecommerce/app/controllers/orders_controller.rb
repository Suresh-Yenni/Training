class OrdersController < ApplicationController

  def home
  end

  def index
    @details = []
    Order.all.each { |odr| @details.push([odr.customer.name, odr.item.item_name]) }
  end

  def new
    @orders = Order.new
    @customers = Customer.all
    @items = Item.all
  end

  def create
    orders = Order.new(params.require(:orders).permit!)
    orders.save
    redirect_to orders_home_path
  end

  def destroy
    orders = Order.find(params[:id])
    cust_id = orders.customer_id
    orders.destroy
    redirect_to customer_path(cust_id)
  end


end
