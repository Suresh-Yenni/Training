class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new
    @customers = Customer.new
  end

  def show
  	customer = Customer.find(params[:id])
  	customer_orders = customer.orders
    items = []
    customer_orders.each { |order| items.push(order.item) }
    
    @details = customer_orders.zip(items)
  end

  def create
    customers = Customer.new(params.require(:customers).permit!)
    customers.save
    redirect_to customers_path
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    @customers.update_attributes(params.require(:customers).permit!)
    redirect_to customers_path
  end

  def destroy
    customers = Customer.find(params[:id])
    customers.destroy
    redirect_to customers_path
  end

end
