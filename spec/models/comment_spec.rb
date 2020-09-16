require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "有効なコメント" do

  end

  # context "無効なコメント" do
  #   it "コメントが書かれていなければ無効な状態であること" do
  #     user = FactoryBot.create(:user)
  #     comment = Comment.new(content: nil, user_id: user.id)
  #     comment.valid?
  #     expect(comment[:content]).to_not be_valid
  #   end
  # end

end
