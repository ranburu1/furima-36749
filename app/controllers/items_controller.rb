class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:title, :explanatory_text, :category_id, :status_id, :price, :shipping_fee_id, :area_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end
|