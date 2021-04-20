# モデルクラス
class Task < ApplicationRecord
  # 必須チェック
  validates :name, presence: true
  # 文字数チェック
  validates :name, length: {maximum: 30}
end
