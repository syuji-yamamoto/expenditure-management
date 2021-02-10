class Expense < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :expense_item
	belongs_to :user
	validates :expense_item_id, presence: true
	validates :price, presence: true
end
