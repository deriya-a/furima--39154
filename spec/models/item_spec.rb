require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品新規登録' do
    ### 正常系テスト
    context '新規登録できるとき' do
      it 'name、detail、category_id、condition_id、delivery_fee_id、region_id、delivery_within_id、priceが正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      ### 異常系テスト
      ## name
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("入力してください")
      end

      ## detail
      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("入力してください")
      end

      ## category_id
      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("選択してください")
      end

      ## condition_id
      it 'condition_idが1では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("選択してください")
      end

      ## delivery_fee_id
      it 'delivery_fee_idが1では登録できない' do
       @item.delivery_fee_id = '1'
       @item.valid?
       expect(@item.errors.full_messages).to include("選択してください")
     end

      ## region_id
      it 'region_idが1では登録できない' do
       @item.region_id = '1'
       @item.valid?
       expect(@item.errors.full_messages).to include("選択してください")
     end

      ## delivery_within_id
      it 'delivery_within_idが1では登録できない' do
       @item.delivery_within_id = '1'
       @item.valid?
       expect(@item.errors.full_messages).to include("選択してください")
     end

      ## price
      it 'priceが空欄では登録できない' do
       @item.price = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("入力してください")
     end

      it 'priceが300未満では登録できない' do
       @item.price = '299'
       @item.valid?
       expect(@item.errors.full_messages).to include("入力してください")
     end

     it 'priceが9999999を超えたら登録できない' do
       @item.price = '10000000'
       @item.valid?
       expect(@item.errors.full_messages).to include("入力してください")
     end

     it 'priceが数字以外だと登録できない（英字）' do
      @item.price = 'aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("入力してください")
    end

     it 'priceが数字以外だと登録できない（全角）' do
       @item.price = 'ああああ'
       @item.valid?
       expect(@item.errors.full_messages).to include("入力してください")
     end
    
    end
  end
end
