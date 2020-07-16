Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/user", to: "users#user"
  patch "/edit_user", to: "users#update"
  post "/logout", to: "users#logout"
  resources :users, only: [:create]
  resources :accounts
  resources :transactions
end

# /accounts/1/transactions