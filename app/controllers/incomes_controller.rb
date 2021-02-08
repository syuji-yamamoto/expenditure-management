class IncomesController < ApplicationController
	before_action :set_income, only: [:show, :edit, :update, :destroy]

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
	end

	def edit
		redirect_to root_path unless @income.user_id == current_user.id
	end

	def update
		if @income.update(params_income)
			redirect_to root_path
		else
			render "edit"
		end
	end

	def destroy
		@income.delete if @income.user_id == current_user.id
		redirect_to root_path
	end

	private

	def params_income
		params.require(:income).permit(:expense_item, :price, :memo).merge(user_id: current_user.id)
	end

	def set_income
		@income = Income.find(params[:id])
	end
end