Rails.application.routes.draw do
  devise_for :devise_users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root to:'products#index'
  # generate all 7 RESTful routes:

  resources :pages


  resources 'products', only: %i[index show]
  get 'categories', to: 'categories#index'

  get 'search', to: 'products#search', as: 'search' #search_path

  get '/p/:permalink', to: 'pages#permalink', as: 'permalink'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
