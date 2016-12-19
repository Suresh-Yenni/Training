Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home', to: 'colleges#home'
  get '/api/students/view', to: 'students#view'
  get '/api/colleges/view', to: 'colleges#view'
  post '/home/search', to: 'colleges#search'
  post '/home/filter', to: 'students#filter'
  get '/home/query', to: 'students#query'
  
  resources :students
  resources :colleges
end
