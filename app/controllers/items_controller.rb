class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :ensure_author, only: [:edit, :update, :destroy]

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
  end

  def edit       
    if @item.record.present?      
       redirect_to root_path
    end
  end 

  def update     
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end 

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :delivery_fee_id, :region_id,
                                 :delivery_within_id, :price).merge(user_id: current_user.id)
  end

  def ensure_author
    unless @item.user == current_user
      flash[:alert] = "編集・更新は出品者のみが行えます"
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])  
  end

end
