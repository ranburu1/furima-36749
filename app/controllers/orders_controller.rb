class OrdersController < ApplicationController
  before_action :move_to_signed_in, expect: [:index]

  def index
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
    if @item.order.present? or current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_shipping_address.valid?
     pay_item
     @order_shipping_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:postcode, :area_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'               
    )
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
