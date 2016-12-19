class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.new(params.require(:items).permit!).save
    redirect_to items_path
  end

  def edit
    @items = Item.item_on_id(params[:id])
  end

  def update
    Item.item_on_id(params[:id]).update_attributes(params.require(:items).permit!)
    redirect_to items_path
  end

  def destroy
    Item.item_on_id(params[:id]).destroy
    redirect_to items_path
  end

end
