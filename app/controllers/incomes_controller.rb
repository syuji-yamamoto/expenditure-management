class IncomesController < ApplicationController

	def new
		@income = Income.new
	end

	def create
		@income = Income.new(params_income)
		if @income.save
			redirect_to root_path
		else
			render "new"
		end
	end

	private

	def params_income
		params.require(:income).permit(:expense_item, :price, :memo).merge(user_id: current_user.id)
	end

end