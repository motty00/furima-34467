require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "email,password,password_confirmation,name,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる" do
      end
      it "passwordとpassword_confirmationが英数字混合の６文字以上だと登録できる" do
      end
    end
    context "新規登録できないとき" do
      it "emailが空だと登録できない" do
      end
      it "emailに@が存在しないと登録できない" do
      end
      it "emailが重複していると登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが存在してもpasspwrd_confirmationが空だと登録できない" do
      end
      it "passwordが英字だけでは登録できない" do
      end
      it "passwordが数字だけでは登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "last_name_kanaが空だと登録できない" do
      end
      it "last_name_kanaがカタカナ以外だと登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaがカタカナ以外だと登録できない" do
      end
      it "birth_dateが空だと登録できない" do
      end
    end
  end
end
