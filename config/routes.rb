Rails.application.routes.draw do
  devise_for :users
  root to: "expenses#index"
  resources :expenses
  resources :incomes, except: [:index]
  resources :users, only: :show do
    member do
      get 'expense_chart'
      get 'income_chart'
    end
  end
end
