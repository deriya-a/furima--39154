class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: '半角英数字混合で入力してください' }

  validates :nickname, presence: true
  validates :family_name_kanji, presence: true,
                                format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}ー－]+\z/, message: '漢字で入力してください' }
  validates :first_name_kanji, presence: true,
                               format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}ー－]+\z/, message: '漢字で入力してください' }
  validates :family_name_kana, presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/, message: 'カタカナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/, message: 'カタカナで入力してください' }
  validates :birthday, presence: true

  #has_many :items
  #has_many :records
end
