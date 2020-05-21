require 'rails_helper'
describe User do
  describe '#create' do

    it "全てが存在すれば登録できること" do
      user = User.new(nickname: "tester", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = User.new(nickname: "tester", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = User.new(nickname: "tester", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "確認用passwordがない場合は登録できないこと" do
      user = User.new(nickname: "tester", email: "kkk@gmail.com", password: "00000000", password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "nicknameが20文字以下であれば登録できること" do
      user = User.new(nickname: "tester", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameが20文字以上は登録できないこと" do
      user = User.new(nickname: "tester00112233445566778899", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "nicknameが20文字以上は登録できないこと" do
      user = User.new(nickname: "tester00112233445566778899", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end
  end
end