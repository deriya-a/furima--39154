class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  # before_action :authenticate_user!, only: [:destroy]
  before_action :ensure_author, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end 

  def update
       @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :delivery_fee_id, :region_id,
                                 :delivery_within_id, :price).merge(user_id: current_user.id)
  end

  def ensure_author
    @item = Item.find(params[:id])
    unless @item.user == current_user
      flash[:alert] = "編集・更新は出品者のみが行えます"
      redirect_to root_path
    end
  end

end
