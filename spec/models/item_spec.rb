require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品の出品ができる場合' do
      it 'title, explanatory_text, category_id, status_id, price, shipping_fee_id, area_id, delivery_days_id, imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanatory_textが空では出品できない' do
        @item.explanatory_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanatory text can't be blank")
      end

      it 'category_idが1(---)では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが1(---)では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end

      it 'shipping_fee_idが1(---)では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
      end

      it 'area_idが1(---)では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end

      it 'delivery_days_idが1(---)では出品できない' do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days must be other than 1')
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが299以下だと出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10000000以上だと出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'ユーザーが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'priceが半角数字でなければ出品できない' do
        @item.price = '２２２２２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
