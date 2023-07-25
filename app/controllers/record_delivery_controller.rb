class RecordDeliveryController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :ensure_not_author, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]

  def index      
    @record_delivery = RecordDelivery.new
    
  end

  def new
  end

  def create           
    @record_delivery = RecordDelivery.new(record_params)    
    if @record_delivery.valid?     
       pay_item
       @record_delivery.save       
       redirect_to root_path
    else    
      render :index         
    end
  end


  private

  def record_params
    params.require(:record_delivery).permit(:post_code, :region_id, :address1, :address2, :address3, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])    
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end  

  def ensure_not_author
    if @item.user == current_user
      flash[:alert] = "出品者は購入できません"
      redirect_to root_path
    end
  end

  def sold_out
    if @item.record.present?      
      redirect_to root_path
    end
  end

 end
