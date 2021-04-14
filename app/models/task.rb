# モデルクラス
class Task < ApplicationRecord
  # 必須チェック
  validates :name, presence: true
end
