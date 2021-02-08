class UsersController < ApplicationController
	def show
		expenses = current_user.expenses
		@expense_sum_price = expenses.all.sum(:price)
		incomes = current_user.incomes
		@income_sum_price = incomes.all.sum(:price)
	end
end