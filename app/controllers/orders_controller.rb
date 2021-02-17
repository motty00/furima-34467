class OrdersController < ApplicationController

  def index
    @order = ItemAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

end
