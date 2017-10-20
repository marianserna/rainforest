class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_secure_password

  validates :name, :email, :avatar, presence: true
end
