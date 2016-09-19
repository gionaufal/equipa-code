Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :equipment, only: [:new, :index, :create, :show]
  resources :prices, only: [:index]
  resources :contracts, only:[:new, :create, :show] do
    resources :return_receipts, only: [:new, :create, :show]
  end

  resources :customers, only: [:new, :create, :show]
  resources :budgets, only: [:new, :create]
  root to: "home#index"
end
