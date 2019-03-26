Rails.application.routes.draw do
  resources :users
  post '/login', to: 'auth#create'
  # get '/trips', to: 'trips#show'
  resources :trips
  # delete '/trips', to: 'trips#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
