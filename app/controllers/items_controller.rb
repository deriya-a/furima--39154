class ItemsController < ApplicationController

  before_action :move_to_user_session, except:index
  before_action :authenticate_user!, only: [:new, :create]
  #before_action :authenticate_user!, only: [:edit, :update, :destroy]
  #before_action :ensure_author, only: [:edit, :update]

  def index
    @items = Item.all
  end


  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to (root_path)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :delivery_fee_id, :region_id, :delivery_within_id, :price).merge(user_id: current_user.id)
  end

  def move_to_user_session
    unless user_signed_in?
      redirect_to action: :new
    end
  end

  

end
