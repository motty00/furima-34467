require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it "image,name,info,price,category_id,status_id,shipping_fee_id,prefecture_id,scheduled_delivery_idが存在すれば保存できる" do
      end
      it "priceが半角数字であれば保存できる" do
      end
      it "priceが300~9,999,999の間であれば登録できる" do
      end
    end


    context '商品出品できないとき' do
      it "imageが空だと登録できない" do
      end
      it "nameが空だと登録できない" do
      end
      it "infoが空だと登録できない" do
      end
      it "priceが空だと登録できない" do
      end
      it "priceが全角では登録できない" do
      end
      it "prceが300~9,999,999の間以外では登録できない" do
      end
      it "category_idが空だと登録できない" do
      end
      it "status_idが空だと登録できない" do
      end
      it "shipping_fee_idが空だと登録できない" do
      end
      it "prefecture_idが空だと登録できない" do
      end
      it "scheduled_delivery_idが空だと登録できない" do
      end
      

    end
  end
end