class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
  

  private

  def item_params
    params.require(:item).permit(:title, :explanatory_text, :category_id, :status_id, :price, :shipping_fee_id, :area_id,
                                 :delivery_days_id, :image).merge(user_id: current_user.id)
  end
end
