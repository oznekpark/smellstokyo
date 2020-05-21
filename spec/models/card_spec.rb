require 'rails_helper'
describe Card do
  describe '#create' do
    context 'cardを保存できる場合' do
      it "全てが存在すれば登録できる" do
        expect(build(:card)).to be_valid
      end
    end
    context 'cardを保存できない場合' do
      it 'card_idがないと保存できない' do
        card = build(:card, card_id: nil)
        card.valid?
        expect(card.errors[:card_id]).to include("を入力してください")
      end

      it 'customer_idがないと保存できない' do
        card = build(:card, customer_id: nil)
        card.valid?
        expect(card.errors[:customer_id]).to include("を入力してください")
      end
    end
  end
end