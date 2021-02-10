class Income < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :income_item
	belongs_to :user
	validates :income_item_id, presence: true
	validates :price, presence: true
end
