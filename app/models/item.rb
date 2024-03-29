class Item < ApplicationRecord
  validates :name,               presence: { message: '入力してください' }
  validates :detail,             presence: { message: '入力してください' }
  validates :category_id,        exclusion: { in: [1], message: '選択してください' }, presence: true
  validates :condition_id,       exclusion: { in: [1], message: '選択してください' }, presence: true
  validates :delivery_fee_id,    exclusion: { in: [1], message: '選択してください' }, presence: true
  validates :region_id,          exclusion: { in: [1], message: '選択してください' }, presence: true
  validates :delivery_within_id, exclusion: { in: [1], message: '選択してください' }, presence: true
  validates :price,              presence: { message: '入力してください' },
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one_attached :image
  has_one :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :region
  belongs_to :delivery_within
end
