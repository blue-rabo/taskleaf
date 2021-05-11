class User < ApplicationRecord
  has_secure_password

  # 必須チェック
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end