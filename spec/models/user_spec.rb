require 'rails_helper'
describe User do
  describe '#create' do

    it "全てが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nikcnameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "確認用passwordがない場合は登録できないこと" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "nicknameが20文字以下であれば登録できること" do
      user = User.new(nickname: "tester", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameが20文字以上は登録できないこと" do
      user = build(:user, nickname: "tester00112233445566778899")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "passwordが6文字以上だと登録できる" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが6文字未満だと登録できない" do
      user = build(:user, password: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "passwordとpassword_confirmationが一致しないと登録できない" do
      user = build(:user, password: "123456")
      user.valid?
      expect(user).not_to be_valid 
    end
  end
end