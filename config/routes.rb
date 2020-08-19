Rails.application.routes.draw do
  
  resources :appointments, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  resources :patients, except: [:index]
  # post 'patients/delete', to: 'patients#destroy', as: 'destroy_patient'


  resources :doctors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'doctors#index'
  # get '/doctors/search', to: 'doctors#search', as: 'search_doctors'
  delete 'sessions/logout', to: 'sessions#logout', as: 'logout'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  post '/sessions/create', to: 'sessions#create', as: 'login'
end
