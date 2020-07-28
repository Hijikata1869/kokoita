class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :picture, ImageUploader
  
  has_many :posts, dependent: :destroy

  validates :nickname, presence: true, length: { minimum: 2, maximum: 30 }
end
