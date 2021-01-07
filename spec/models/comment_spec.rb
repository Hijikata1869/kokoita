require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }

  context '有効なコメント' do
    it 'ユーザ、ポスト、適当な文字数であれば有効なこと' do
      expect(comment).to be_valid
    end
    it ' 2文字のコメント ' do
      comment = FactoryBot.build(:comment, content: 'a' * 2)
      comment.valid?
      expect(comment).to be_valid
    end
    it '255文字のコメント' do
      comment = FactoryBot.build(:comment, content: 'a' * 255)
      comment.valid?
      expect(comment).to be_valid
    end
  end

  context '無効なコメント' do
    it '空のコメント' do
      comment = FactoryBot.build(:comment, content: nil)
      comment.valid?
      expect(comment).to_not be_valid
    end
    it '1文字のコメント' do
      comment = FactoryBot.build(:comment, content: 'a')
      comment.valid?
      expect(comment).to_not be_valid
    end
    it ' 256文字のコメント ' do
      comment = FactoryBot.build(:comment, content: 'a' * 256)
      comment.valid?
      expect(comment).to_not be_valid
    end
  end
end
