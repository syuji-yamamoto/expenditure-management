class ExpensesController < ApplicationController
	def index

	end

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(params_expense)
		if @expense.save
			redirect_to root_path
		else
			render "new"
		end
	end

	private

	def params_expense
		params.require(:expense).permit(:expense_item, :price, :memo).merge(user_id: current_user.id)
	end
end