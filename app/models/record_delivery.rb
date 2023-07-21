class RecordDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :address1, :address2, :address3, :phone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :address1
    validates :address2
    validates :phone, numericality: { only_integer: true, greater_than_or_equal_to: 1000000000, less_than_or_equal_to: 99999999999 }
    validates :token
  end
  
  def save
    # 購入情報を保存し、変数recordに代入する
    record = Record.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # record_idには、変数recordのidと指定する
    Delivery.create(post_code: post_code, region_id: region_id, address1: address1, address2: address2, address3: address3, phone: phone, record_id: record.id)    
  end


end