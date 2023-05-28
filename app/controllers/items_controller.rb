class ItemsController < ApplicationController

  before_action :move_to_index, except:index
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

end
