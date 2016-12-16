class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    items = Item.new(params.require(:items).permit!)
    items.save
    redirect_to items_path
  end

  def edit
    @items = Item.find(params[:id])
  end

  def update
    items = Item.find(params[:id])
    items.update_attributes(params.require(:items).permit!)
    redirect_to items_path
  end

  def destroy
    items = Item.find(params[:id])
    items.destroy
    redirect_to items_path
  end

end
