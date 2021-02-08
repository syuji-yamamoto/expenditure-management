class UsersController < ApplicationController
	def show
		@expenses = current_user.expenses
		@incomes = current_user.incomes
	end
end