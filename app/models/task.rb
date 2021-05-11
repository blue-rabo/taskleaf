# モデルクラス
class Task < ApplicationRecord
  # 必須チェック
  validates :name, presence: true
  # 文字数チェック
  validates :name, length: {maximum: 30}
  # カンマチェック
  validate :validate_name_not_including_comma
  # 「名前なし」を自動でつけるコールバック機能 ※実験とどめ、taskleafアプリケーションに入れないようにする
  before_validation :set_nameless_name
  
  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end

  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end
end
