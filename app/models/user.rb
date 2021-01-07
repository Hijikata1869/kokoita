class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :picture, ImageUploader

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true, length: { minimum: 2, maximum: 30 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com', nickname: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
