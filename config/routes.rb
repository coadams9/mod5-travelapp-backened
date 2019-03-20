Rails.application.routes.draw do
  resources :users
  post '/login', to: 'auth#create'
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
