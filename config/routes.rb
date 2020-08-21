Rails.application.routes.draw do
  
  resources :appointments
  resources :patients, except: [:index]
  resources :doctors, only: [:index, :show]
  
  root 'doctors#index'
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  post '/sessions/create', to: 'sessions#create', as: 'login'
  
end
