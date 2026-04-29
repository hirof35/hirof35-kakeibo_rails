class Record < ApplicationRecord
    # 金額と日付は必須。さらに金額は0より大きい数字のみ許可
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :date, presence: true
    validates :category, presence: true
  end