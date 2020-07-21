require 'rails_helper'

RSpec.describe User, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      nickname: "Aaron Sumner",
      email: "tester@example.com",
      password: "dottle-nouveau-pavlion-tights-furze",
    )
    expect(user).to be_valid
  end
  # ニックネームがなければ無効な状態であるということ
  it "is invalid without a nickname" do
    user = User.new(nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end
  # ニックネームは30文字以内であるということ
  it "ニックネームは30文字以内" do
    user = User.new(nickname: "a" * 100)
    user.valid?
    expect(user.errors[:nickname]).to include("は30文字以内で入力してください")
  end
  # メールアドレスがなければ無効な状態であるということ
  it "is invalid without an email address"
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      nickname: "Joe Tester",
      email: "tester@example.com",
      password: "dottle-nouveau-pavlion-tights-furze",
    )
    user = User.new(
      nickname: "Jane Tester",
      email: "tester@example.com",
      password: "dottle-nouveau-pavlion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
  # ユーザーのフルネームを文字列として返すこと
  it "returns a user's full name as a string"
end
