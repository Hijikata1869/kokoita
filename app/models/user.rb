class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :picture, ImageUploader

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # 自分がフォローしているユーザとの関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower

  # 自分がフォローされるユーザとの関係
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  validates :nickname, presence: true, length: { minimum: 2, maximum: 30 }

  def following?(user)
    active_relationships.find_by(follower_id: user.id)
  end

  def follow(user)
    active_relationships.create!(follower_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(follower_id: user.id).destroy
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', nickname: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
