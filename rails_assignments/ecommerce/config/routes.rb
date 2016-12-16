Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "orders/home"
  resources :orders
  resources :customers
  resources :items
end
