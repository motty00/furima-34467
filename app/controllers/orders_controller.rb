class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

end
