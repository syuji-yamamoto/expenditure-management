class Income < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :income_item
	belongs_to :user
	validates :income_item_id, presence: true
	validates :price, presence: true

	class << self
    def income_name #グラフに渡すハッシュデータを形成するメソッド
      incomes = all
      income_data = {}
    	incomes.each_with_index do |income, index|
        income_data = { income.income_item.name => 1 } if index.zero? #eachでDBから取得したデータを回し、既に、keyとして存在しているかをチェックする
        if income_data.key?(income.income_item.name) #もう既に存在していれば割合の基準となるvalueに1を足していく
          income_data[income.income_item.name] += 1
        else
          income_data[income.income_item.name] = 1
        end
      end
      income_data
    end
	end
end
