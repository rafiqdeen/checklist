class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :about]

  def index
    if user_signed_in?
      @items = current_user.items.order("created_at DESC")
      @items_by_month = @items.group_by { |post| post.created_at.strftime("%m/%d/%Y") }
    end
  end

  def new
    @item = current_user.items.new
  end

  def show
    @item = current_user.items.find(params[:id])
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @item = current_user.items.find(params[:id])

    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def complete
    @item = current_user.items.find(params[:id])
    @item.update_attribute(:completed_at, Time.now)
    redirect_to root_path, notice: "Item successfully completed!"
  end

  def incomplete
    @item = current_user.items.find(params[:id])
    @item.update_attribute(:completed_at, nil)
    redirect_to root_path, notice: "Item InProgress!"
  end

  private
  def item_params
    params.require(:item).permit(:title, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
