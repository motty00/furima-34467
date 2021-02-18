require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @address = FactoryBot.build(:order_address)
  end
  describe '購入情報登録' do
    context '購入情報が登録できるとき' do
      it 'postal_code、prefecture_id、city、address、phone_numberが存在すれば登録できる' do
        expect(@address).to be_valid
      end
      it 'postal_codeには「-]ハイフンが存在すれば登録できる' do
        @address.postal_code = "123-1234"
        expect(@address).to be_valid
      end
      it 'buildingは存在しなくても登録できる' do
        @address.building = ""
        expect(@address).to be_valid
      end
      it 'phone_numberは11桁以内の数字であれば登録できる' do
        @address.phone_number = "0901234123"
        expect(@address).to be_valid
      end
    end


    context '購入情報が登録できないとき' do
      it 'postal_codeが空だと登録できない' do
        @address.postal_code = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it 'postal_codeに「-」ハイフンが存在しないと登録できない' do
        @address.postal_code = "1231234"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが「１」だと登録できない' do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと登録できない' do
        @address.city = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @address.address = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @address.phone_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数字以外だと登録できない' do
        @address.phone_number = "aaaaaaaaaa"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is not a number")
      end
    end
  end
end



