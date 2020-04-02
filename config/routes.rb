Rails.application.routes.draw do

  # generate all 7 RESTful routes:
  resources :pages

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to:'products#index'

  resources 'products', only: %i[index show]
  get 'categories', to: 'categories#index'


  get ':permalink', to: 'pages#permalink', as: 'permalink'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
