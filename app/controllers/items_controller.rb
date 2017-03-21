class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit

  end

  def create
    @item = Item.new(item_params)

    @item.save
    redirect_to @item
  end

  def complete
    @item = Item.find(params[:id])
    @item.update_attribute(:completed_at, Time.now)
    redirect_to root_path, notice: "Item successfully completed!"
  end

  def incomplete
    @item = Item.find(params[:id])
    @item.update_attribute(:completed_at, nil)
    redirect_to root_path, notice: "Item InProgress!"
  end

  private
  def item_params
    params.require(:item).permit(:title, :description)
  end
end
