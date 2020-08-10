class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture

  has_many :likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :found_animal, presence: true
  validates :category_id, presence: true
  validates :prefecture_id, presence: true
  validates :found_date, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
