class ExpensesController < ApplicationController
	def index
		@expenses = Expense.order(created_at: "DESC").limit(5)
		@incomes = Income.all
	end

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(params_expense)
		if @expense.valid?
			@expense.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def show
		@expense = Expense.find(params[:id])
	end

	def edit
		@expense = Expense.find(params[:id])
		redirect_to root_path unless @expense.user_id == current_user.id
	end

	def update
		@expense = Expense.find(params[:id])
		if @expense.update(params_expense)
			redirect_to root_path
		else
			render "edit"
		end
	end

	private

	def params_expense
		params.require(:expense).permit(:expense_item, :price, :memo).merge(user_id: current_user.id)
	end
end