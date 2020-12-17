Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :customers
  resources :staffs
  resources :sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'customer_welcome', to: 'sessions#customer_welcome'
  get 'staff_welcome', to: 'sessions#staff_welcome'
  get '/logout' => 'sessions#destroy'
end
