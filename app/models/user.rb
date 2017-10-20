class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_secure_password
  has_many :reviews

  validates :name, :email, :avatar, presence: true
end
