Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home', to: 'colleges#home'
  post '/home/search', to: 'colleges#search'
  post '/home/filter', to: 'students#filter'
  get '/home/query', to: 'students#query'
  
  resources :students
  resources :colleges
end
