Rails.application.routes.draw do
  root to:'products#index'

  get 'products/:id', to: 'products#show', as: 'product'
  get 'categories', to: 'categories#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
