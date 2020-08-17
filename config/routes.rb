Rails.application.routes.draw do
  
  resources :appointments, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  resources :patients, except: [:index]
  # post 'patients/delete', to: 'patients#destroy', as: 'destroy_patient'


  resources :doctors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'doctors#index'

  get '/sessions/new_login', to: 'users#new_login', as: 'new_login'
  get '/patients/new', to: 'patients#new', as: 'signup'

end
