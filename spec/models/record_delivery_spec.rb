require 'rails_helper'

RSpec.describe RecordDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)    
    @record_delivery = FactoryBot.build(:record_delivery, user_id: user.id, item_id: item.id)
  end

  describe '購入情報と配送先情報の保存' do
    ### 正常系テスト
    context '購入できるとき' do
      it 'user_id, item_id, post_code, region_id, address1, address2, address3, phone, tokenが正しく存在すれば登録できる' do
        expect(@record_delivery).to be_valid
      end

      it 'address3が空欄でもその他が正しく存在すれば登録できる' do
        @record_delivery.address3 = ''
        expect(@record_delivery).to be_valid
      end
    end

    context '購入できないとき' do
      ### 異常系テスト
      ## user_id
      it 'userが紐付いていなければ登録できない' do
        @record_delivery.user_id = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("User can't be blank")
      end

      ## item_id
      it 'itemが紐付いていなければ登録できない' do
        @record_delivery.item_id = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Item can't be blank")
      end

      ## post_code
      it 'post_codeが空欄では登録できない' do
        @record_delivery.post_code = ''
        @record_delivery.valid?      
        expect(@record_delivery.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがないと登録できない' do
        @record_delivery.post_code = '1234567'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      
      ## region_id
      it 'region_idが1では登録できない' do
        @record_delivery.region_id = '1'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Region can't be blank")
      end   

      ## address1
      it 'address1が空欄では登録できない' do
        @record_delivery.address1 = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Address1 can't be blank")
      end      

      ## address2
      it 'address2が空欄では登録できない' do
        @record_delivery.address2 = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Address2 can't be blank")
      end      

      ## phone
      it 'phoneが空欄では登録できない' do
        @record_delivery.phone = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが10桁未満では登録できない' do
        @record_delivery.phone = '123456789'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone must be 10 digits or 11 digits number")
      end

      it 'phoneが11桁を超えたら登録できない' do
        @record_delivery.phone = '123456789012'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone must be 10 digits or 11 digits number")
      end

      it 'phoneが数字以外だと登録できない（英字）' do
        @record_delivery.phone = 'aaaaaaaaaa'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone must be 10 digits or 11 digits number")
      end

      it 'phoneに数字以外が入っていると登録できない' do
        @record_delivery.phone = '090-123-456'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone must be 10 digits or 11 digits number")
      end

      ## token
      it 'tokenがなければ登録できない' do
        @record_delivery.token = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Token can't be blank")
      end
     
    end
  end
end
