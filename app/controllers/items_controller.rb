class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_edit, only: [:edit, :update]
  before_action :set_destroy, only: [:destroy]

  def index
    @items = Item.all.order('created_at desc')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :prefecture_id, :shipping_fee_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_edit
    redirect_to root_path if current_user.id != @item.user_id
  end

  def set_destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
      redirect_to root_path
  end
end
