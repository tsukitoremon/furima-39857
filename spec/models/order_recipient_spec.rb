require 'rails_helper'

RSpec.describe OrderRecipient, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_recipient = FactoryBot.build(:order_recipient, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'orderとpost_code、tel_numberとdelivery_from、address_cityとaddress_streetが存在すれば登録できる' do
        @order_recipient = FactoryBot.build(:order_recipient, user_id: @user.id, item_id: @item.id)
        expect(@order_recipient).to be_valid
      end
      it '建物名が空でも登録できる' do
        @order_recipient = FactoryBot.build(:order_recipient, user_id: @user.id, item_id: @item.id)
        @order_recipient.address_building = ''
        expect(@order_recipient).to be_valid
      end
    end
    context '購入できない場合' do
      it 'tokenが空では登録できない' do
        @order_recipient.token = ''
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では登録できない' do
        @order_recipient.post_code = ''
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeに'-'を欠いては登録できない" do
        @order_recipient.post_code = '55334444'
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが6桁以下だと登録できない' do
        @order_recipient.post_code = '553―444'
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが8桁以上だと登録できない' do
        @order_recipient.post_code = '553―44444'
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが文字列では登録できない' do
        @order_recipient.post_code = 'あいうえお'
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'tel_numberが空では登録できない' do
        @order_recipient.tel_number = ''
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが9文字以下では登録できない' do
        @order_recipient.tel_number = '012044444'
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include('Tel number Input only number')
      end
      it 'tel_numberが12文字以上では登録できない' do
        @order_recipient.tel_number = '012044444444'
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include('Tel number Input only number')
      end
      it 'tel_numberが文字列では登録できない' do
        @order_recipient.tel_number = 'あいうえお'
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include('Tel number Input only number')
      end
      it 'delivery_fromが---では登録できない' do
        @order_recipient.delivery_from_id = '1'
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include("Delivery from can't be blank")
      end
      it 'address_cityが空では登録できない' do
        @order_recipient.address_city = ''
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include("Address city can't be blank")
      end
      it 'address_streetが空では登録できない' do
        @order_recipient.address_street = ''
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include("Address street can't be blank")
      end
      it 'userが紐付いていなければ登録できない' do
        @order_recipient.user_id = nil
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ登録できない' do
        @order_recipient.item_id = nil
        @order_recipient.valid?
        expect(@order_recipient.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
