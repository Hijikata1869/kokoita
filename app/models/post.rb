class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  mount_uploader :image, ImageUploader

  validates :found_animal, presence: true, length: { maximum: 255 }
  validates :category_id, presence: true
  validates :prefecture_id, presence: true
  validates :found_date, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def save_tag(sent_tags)
    # このselfはposts_controller.rbで定義された@postのこと
    # @postというインスタンスに対して「.(ドット)」で繋げてインスタンスメソッドを呼び出すとき、インスタンスメソッド内では「self」が使える
    # self=呼び出し元のインスタンス(@post)となる
    current_tags = self.tags.pluck(:tag_name) unless  self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.post_tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.post_tags << new_post_tag
    end
  end
end
