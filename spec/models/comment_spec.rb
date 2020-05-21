require 'rails_helper'
describe Comment do
  describe '#create' do
    context "commentを保存できる場合" do
      it 'textがあれば保存できる' do
        expect(build(:comment, rate: nil)).to be_valid
      end

      it "全てが存在すれば登録できる" do
        expect(build(:comment)).to be_valid
      end
    end
    context "commentを保存できない場合" do
      it 'textが空だと保存できない' do
        comment = build(:comment, text: nil)
        comment.valid?
        expect(comment.errors[:text]).to include("を入力してください")
      end

      it 'user_idがないと保存できない' do
        comment = build(:comment, user_id: nil)
        comment.valid?
        expect(comment.errors[:user]).to include("を入力してください")
      end

      it 'product_idがないと保存できない' do
        comment = build(:comment, product_id: nil)
        comment.valid?
        expect(comment.errors[:product]).to include("を入力してください")
      end
    end
  end
end