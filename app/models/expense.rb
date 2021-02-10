class Expense < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :expense_item
	belongs_to :user
	validates :expense_item_id, presence: true
	validates :price, presence: true

	class << self
    def expense_name #グラフに渡すハッシュデータを形成するメソッド
      expenses = all
      expense_data = {}
    	expenses.each_with_index do |expense, index|
        expense_data = { expense.expense_item.name => 1 } if index.zero? #eachでDBから取得したデータを回し、既に、keyとして存在しているかをチェックする
        if expense_data.key?(expense.expense_item.name) #もう既に存在していれば割合の基準となるvalueに1を足していく
          expense_data[expense.expense_item.name] += 1
        else
          expense_data[expense.expense_item.name] = 1
        end
      end
      expense_data
    end
	end
end
