class Expense < ApplicationRecord
	belongs_to :user
	validates :expense_item, presence: true
	validates :price, presence: true
end
