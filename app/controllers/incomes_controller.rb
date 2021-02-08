class IncomesController < ApplicationController

	def new
		@income = Income.new
	end

	def create
		@income = Income.new(params_income)
		if @income.valid?
			@income.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def show
		@income = Income.find(params[:id])
	end

	def edit
		@income = Income.find(params[:id])
		redirect_to root_path unless @income.user_id == current_user.id
	end

	def update
		@income = Income.find(params[:id])
		if @income.update(params_income)
			redirect_to root_path
		else
			render "edit"
		end
	end

	private

	def params_income
		params.require(:income).permit(:expense_item, :price, :memo).merge(user_id: current_user.id)
	end

end