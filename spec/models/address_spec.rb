require 'rails_helper'
describe Address do
  describe '#create' do
    context 'addressを保存できる場合' do
      it "全てが存在すれば登録できる" do
        expect(build(:address)).to be_valid
      end

      it "address_buildingとphone_numberがなくても登録できる" do
        expect(build(:address, address_building: nil, phone_number: nil)).to be_valid
      end

      it "postcodeは全角でも登録できる" do
        expect(build(:address, postcode: "１５０００４１")).to be_valid
      end

      it "phone_numberは全角でも登録できる" do
        expect(build(:address, phone_number: "０９０１２３４５６７８")).to be_valid
      end

    end
    context 'addressを保存できない場合' do
      it "destination_first_nameがない場合は登録できないこと" do
        address = build(:address, destination_first_name: nil)
        address.valid?
        expect(address.errors[:destination_first_name]).to include("を入力してください")
      end
  
      it "destination_family_nameがない場合は登録できないこと" do
        address = build(:address, destination_family_name: nil)
        address.valid?
        expect(address.errors[:destination_family_name]).to include("を入力してください")
      end
  
      it "postcodeがない場合は登録できないこと" do
        address = build(:address, postcode: nil)
        address.valid?
        expect(address.errors[:postcode]).to include("を入力してください")
      end
  
      it "prefecture_codeがない場合は登録できないこと" do
        address = build(:address, prefecture_code: nil)
        address.valid?
        expect(address.errors[:prefecture_code]).to include("を入力してください")
      end
  
      it "address_cityがない場合は登録できないこと" do
        address = build(:address, address_city: nil)
        address.valid?
        expect(address.errors[:address_city]).to include("を入力してください")
      end
  
      it "address_streetがない場合は登録できないこと" do
        address = build(:address, address_street: nil)
        address.valid?
        expect(address.errors[:address_street]).to include("を入力してください")
      end

      it "destination_family_nameが英字だと登録できない" do
        address = build(:address, destination_family_name: "ishida")
        address.valid?
        expect(address.errors[:destination_family_name]).to include("は不正な値です")
      end

      it "destination_family_nameが半角だと登録できない" do
        address = build(:address, destination_family_name: "ｲｼﾀﾞ")
        address.valid?
        expect(address.errors[:destination_family_name]).to include("は不正な値です")
      end

      it "destination_first_nameが英字だと登録できない" do
        address = build(:address, destination_first_name: "ishida")
        address.valid?
        expect(address.errors[:destination_first_name]).to include("は不正な値です")
      end

      it "destination_first_nameが半角だと登録できない" do
        address = build(:address, destination_first_name: "ｲｼﾀﾞ")
        address.valid?
        expect(address.errors[:destination_first_name]).to include("は不正な値です")
      end

      it "destination_family_name_kanaが英字だと登録できない" do
        address = build(:address, destination_family_name_kana: "ishida")
        address.valid?
        expect(address.errors[:destination_family_name_kana]).to include("は不正な値です")
      end

      it "destination_family_name_kanaが半角だと登録できない" do
        address = build(:address, destination_family_name_kana: "ｲｼﾀﾞ")
        address.valid?
        expect(address.errors[:destination_family_name_kana]).to include("は不正な値です")
      end

      it "destination_first_name_kanaが全角でないと登録できない" do
        address = build(:address, destination_first_name_kana: "ishida")
        address.valid?
        expect(address.errors[:destination_first_name_kana]).to include("は不正な値です")
      end

      it "destination_first_name_kanaが半角だと登録できない" do
        address = build(:address, destination_first_name_kana: "ｲｼﾀﾞ")
        address.valid?
        expect(address.errors[:destination_first_name_kana]).to include("は不正な値です")
      end

      it "postcodeは7桁以外だと登録できない" do
        address = build(:address, postcode: "15000412")
        address.valid?
        expect(address.errors[:postcode]).to include("は不正な値です")
      end
    end
  end
end