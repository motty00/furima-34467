require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it "image,name,info,price,category_id,status_id,shipping_fee_id,prefecture_id,scheduled_delivery_idが存在すれば保存できる" do
        expect(@item).to be_valid
      end
      it "priceが半角数字であれば保存できる" do
        @item.price = "1234"
        expect(@item).to be_valid
      end
      it "priceが300~9,999,999の間であれば登録できる" do
        @item.price = "100000"
        expect(@item).to be_valid
      end
    end


    context '商品出品できないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "infoが空だと登録できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角では登録できない" do
        @item.price = "１２３４"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "prceが300~9,999,999の間以外では登録できない" do
        @item.price = "10"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "status_idが空だと登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "shipping_fee_idが空だと登録できない" do
        @item.shipping_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee is not a number")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "scheduled_delivery_idが空だと登録できない" do
        @item.scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery is not a number")
      end
    end
  end
end