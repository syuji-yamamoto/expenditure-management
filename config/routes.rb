Rails.application.routes.draw do
  devise_for :users
  root to: "expenses#index"
  resources :expenses
  resources :incomes, except: [:index]
  resources :users, only: :show
end
