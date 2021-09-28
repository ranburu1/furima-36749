require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end
      it 'buildingが空でも保存ができること' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'poscodeが空だと保存できないこと' do
        @order_shipping_address.postcode = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'area_idが1(---)だと保存できないこと' do
        @order_shipping_address.area_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Area must be other than 1')
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だとと保存できないこと' do
        @order_shipping_address.block = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'userが紐づいていないと保存できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'phone_numberが９文字以下だと保存できないこと' do
        @order_shipping_address.phone_number = '123445678'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12文字以上だと保存できないこと' do
        @order_shipping_address.phone_number = '1234456789101'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが半角数字でなければ保存できないこと' do
        @order_shipping_address.phone_number = '１２３４５６７８９０'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'poscodeがハイフンがなければ保存できないこと' do
        @order_shipping_address.postcode = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postcode is invalid')
      end

      it 'poscodeが半角数字でなければ保存できないこと' do
        @order_shipping_address.postcode = '１２３-３４５６'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postcode is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
