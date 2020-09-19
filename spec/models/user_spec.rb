require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.create(:user) }

  # it "ポストを持っていること" do
  #   user = FactoryBot.create(:user, :with_posts)
  #   expect(user.posts.length).to eq 5
  # end

  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "ニックネーム、メール、パスワードがあれば有効な状態であること" do
    user = FactoryBot.build(:user)
    user.valid?
    expect(user).to be_valid
  end

  describe "ニックネームのバリデーション" do
    context "有効なニックネーム" do
      it "2文字のニックネーム" do
        user = FactoryBot.build(:user, nickname: "a" * 2)
        user.valid?
        expect(user[:nickname]).to_not include("を入力してください")
      end
      it "30文字のニックネーム" do
        user = FactoryBot.build(:user, nickname: "a" * 30)
        user.valid?
        expect(user[:nickname]).to_not include("を入力してください")
      end
    end

    context "無効なニックネーム" do
      it "ニックネームが無ければ無効な状態であるということ" do
        user = FactoryBot.build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end
      it "31文字のニックネーム" do
        user = FactoryBot.build(:user, nickname: "a" * 31)
        user.valid?
        expect(user.errors[:nickname]).to include("は30文字以内で入力してください")
      end
      it "1文字だけのニックネーム" do
        user = FactoryBot.build(:user, nickname: "a")
        user.valid?
        expect(user.errors[:nickname]).to include("は2文字以上で入力してください")
      end
    end
  end

  describe "メールアドレスのバリデーション" do
    it "メールアドレスがなければ無効な状態であるということ" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "重複したメールアドレスなら無効な状態であること" do
      FactoryBot.create(:user, email: "aaron@example.com")
      user = FactoryBot.build(:user, email: "aaron@example.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end

  describe "パスワードのバリデーション" do
    context "有効なパスワード" do
      it "6文字のパスワード" do
        user = FactoryBot.build(:user, password: "a" * 6)
        user.valid?
        expect(user.errors[:password]).to be_empty
      end
      it "128文字のパスワード" do
        user = FactoryBot.build(:user, password: "a" * 128)
        user.valid?
        expect(user.errors[:password]).to be_empty
      end
    end
    context "無効なパスワード" do
      it "5文字のパスワード" do
        user = FactoryBot.build(:user, password: "a" * 5)
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
      it "129文字のパスワード" do
        user = FactoryBot.build(:user, password: "a" * 129)
        user.valid?
        expect(user.errors[:password]).to include("は128文字以内で入力してください")
      end
    end
  end
  
end
