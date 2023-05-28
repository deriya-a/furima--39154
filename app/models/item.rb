class Item < ApplicationRecord

  validates :name,               presence: { message: '入力してください' }
  validates :detail,             presence: { message: '入力してください' }
  validates :category_id,        presence: { message: '選択してください' }
  validates :condition_id,       presence: { message: '選択してください' }
  validates :delivery_fee_id,    presence: { message: '選択してください' }
  validates :region_id,          presence: { message: '選択してください' }
  validates :delivery_within_id, presence: { message: '選択してください' }
  validates :price,              presence: { message: '入力してください' }
 

  belongs_to :user
  #has_one :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :region
  belongs_to :delivery_within

 
end
