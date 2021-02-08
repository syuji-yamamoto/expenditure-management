class ExpensesController < ApplicationController
	before_action :set_expense, only: [:show, :edit, :update, :destroy]

	def index
		@expenses = Expense.order(created_at: "DESC").limit(5)
		@incomes = Income.order(created_at: "DESC").limit(5)
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
	end

	def edit
		redirect_to root_path unless @expense.user_id == current_user.id
	end

	def update
		if @expense.update(params_expense)
			redirect_to root_path
		else
			render "edit"
		end
	end

	def destroy
		@expense.delete if @expense.user_id == current_user.id
		redirect_to root_path
	end

	private

	def params_expense
		params.require(:expense).permit(:expense_item, :price, :memo).merge(user_id: current_user.id)
	end

	def set_expense
		@expense = Expense.find(params[:id])
	end
end