Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  resources :products do
    resources :reviews
  end

  resources :order_items
  resource :cart, only: [:show] do
    resources :charges
  end

  resources :accounts, only: [:index, :update]
  resources :orders, only: [:index]
end
