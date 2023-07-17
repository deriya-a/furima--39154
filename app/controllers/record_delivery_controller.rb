class RecordDeliveryController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
  end

  def create
    @record = Record.create(record_params)
    Delilvery.create(delivery_params)
    redirect_to root_path
  end


  private

  def record_params
    params.merge(user_id: current_user.id, item_id: curernt_item.id)
  end

  def delivery_params
    params.permit(:post_code, :region_id, :address1, :address2, :address3, :phone).merge(record_id: @record.id)
  end

end
