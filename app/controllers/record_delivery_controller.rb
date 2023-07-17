class RecordDeliveryController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @record_delivery = RecordDelivery.new
  end

  def create
    @record_delivery = RecordDelivery.new(record_params)
    if @record_delivery.valid?
      pay_item
       @record_delivery.save
       redirect_to root_path
    else
       render :new  
    end
  end


  private

  def record_params
    params.require(:record_delivery).permit(:post_code, :region_id, :address1, :address2, :address3, :phone).merge(user_id: current_user.id, item_id: curernt_item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

 end
