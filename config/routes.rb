Rails.application.routes.draw do
  devise_for :users
  root to: "expenses#index"
  resources :expenses, only: [:new, :create, :show]
  resources :incomes, only: [:new, :create, :show]
end
