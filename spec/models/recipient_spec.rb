require 'rails_helper'

RSpec.describe Recipient, type: :model do
  before do
    @recipient = FactoryBot.build(:recipient)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'orderとpost_code、tel_numberとdelivery_from、address_cityとaddress_streetが存在すれば登録できる' do
        expect(@recipient).to be_valid
      end
    end
    context '購入できない場合' do
      it 'orderが空では登録できない' do
        @recipient.order.id = ''
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include("Order can't be blank")
      end
      it 'post_codeが空では登録できない' do
        @recipient.post_code = ''
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeに'-'を欠いては登録できない" do
        @recipient.post_code = '55334444'
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'post_codeが6桁以下だと登録できない' do
        @recipient.post_code = '553―444'
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'post_codeが8桁以上だと登録できない' do
        @recipient.post_code = '553―44444'
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'post_codeが文字列では登録できない' do
        @recipient.post_code = 'あいうえお'
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'tel_numberが空では登録できない' do
        @recipient.tel_number = ''
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが9文字以下では登録できない' do
        @recipient.tel_number = '012044444'
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include('Tel number is too short')
      end
      it 'tel_numberが12文字以上では登録できない' do
        @recipient.tel_number = '012044444444'
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include('Tel number is too long')
      end
      it 'tel_numberが文字列では登録できない' do
        @recipient.tel_number = 'あいうえお'
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include('Tel number is invalid. Input only number')
      end
      it 'delivery_fromが---では登録できない' do
        @recipient.delivery_from = '1'
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include("Delivery from can't be blank")
      end
      it 'address_cityが空では登録できない' do
        @recipient.address_city = ''
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include("Address city can't be blank")
      end
      it 'address_streetが空では登録できない' do
        @recipient.address_street = ''
        @recipient.valid?
        expect(@recipient.errors.full_messages).to include("Address street can't be blank")
      end
    end
  end
end
