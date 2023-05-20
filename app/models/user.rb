class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "は半角英数字混合で入力してください" }

  validates :nickname, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
 
end
