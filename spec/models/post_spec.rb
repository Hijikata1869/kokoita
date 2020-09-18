require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:post) { FactoryBot.create(:post) }

  context "有効なポスト" do
    it "生き物の名前、カテゴリー、発見場所、発見年／月が選択されていれば有効な投稿であること" do
      expect(post).to be_valid
    end
  end

  context "無効なポスト" do
    it "見つけた生き物の名前がなければ無効な状態であるということ" do
      post = Post.new(found_animal: nil)
      post.valid?
      expect(post.errors[:found_animal]).to include("を入力してください")
    end
    it "256文字以上の見つけた生き物の名前" do
      post = Post.new(found_animal: "a" * 256)
      post.valid?
      expect(post).to_not be_valid
    end
    it "見つけた生き物のカテゴリーが選択されていなければ無効であるということ" do
      post = Post.new(category_id: nil)
      post.valid?
      expect(post.errors[:category_id]).to include("を入力してください")
    end
    it "見つけた生き物の発見場所が選択されていなければ無効であるということ" do
      post = Post.new(prefecture_id: nil)
      post.valid?
      expect(post.errors[:prefecture_id]).to include("を入力してください")
    end
    it "見つけた生き物の発見年／月が選択されていなければ無効であるということ" do
      post = Post.new(found_date: nil)
      post.valid?
      expect(post.errors[:found_date]).to include("を入力してください")
    end
  end
end
