class UsersController < ApplicationController
	def show
		expenses = current_user.expenses
		@expense_sum_price = expenses.all.sum(:price)
		incomes = current_user.incomes
		@income_sum_price = incomes.all.sum(:price)
		@total_amount = @income_sum_price - @expense_sum_price
	end

	def expense_chart
		@expense_data = Expense.expense_name
	end

	def income_chart
		@income_data = Income.income_name
	end
end