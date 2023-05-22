require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'passwordが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'nicknameが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'family_name_kanjiが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'first_name_kanjiが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'family_name_kanaが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'first_name_kanaが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'birthdayが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end

  end
end
