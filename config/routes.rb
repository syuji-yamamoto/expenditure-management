Rails.application.routes.draw do
  devise_for :users
  root to: "expenses#index"
  resources :expenses, only: [:new]
  resources :incomes, only: [:new]
end
