Rails.application.routes.draw do
  # devise_for :devise_users, :controllers => {registrations: "devise_users/registrations"}

  # devise_for :devise_users, :controllers => {registrations: "devise_users/registrations",
  #                                            sessions: "devise_users/sessions"} do
  #       get "devise_users/sign_up", to: "devise_users/registrations#new"
  # end

  devise_for :devise_users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "products#index"

  # generate all 7 RESTful routes:

  resources :pages

  resources "products", only: %i[index show]
  resources :shopping_carts
  resources :line_items
  resources :addresses

  get "categories", to: "categories#index"

  get "search", to: "products#search", as: "search" #search_path

  get "/p/:permalink", to: "pages#permalink", as: "permalink"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
