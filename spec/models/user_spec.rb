require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_yomi、first_name_yomi、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '111bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが半角英数では登録できない' do
        @user.last_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角英数では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_name_yomiが空では登録できない' do
        @user.last_name_yomi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name yomi can't be blank")
      end
      it 'last_name_yomiがひらがなでは登録できない' do
        @user.last_name_yomi = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name yomi is invalid. Input full-width katakana characters.')
      end
      it 'first_name_yomiが空では登録できない' do
        @user.first_name_yomi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name yomi can't be blank")
      end
      it 'first_name_yomiがひらがなでは登録できない' do
        @user.first_name_yomi = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name yomi is invalid. Input full-width katakana characters.')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'hogemail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
    end
  end
end
