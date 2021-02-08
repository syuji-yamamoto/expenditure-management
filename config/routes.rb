Rails.application.routes.draw do
  devise_for :users
  root to: "expenses#index"
  resources :expenses, only: [:new, :create, :show, :edit, :update]
  resources :incomes, only: [:new, :create, :show, :edit, :update]
end
