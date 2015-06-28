Rails.application.routes.draw do
  devise_for :users
  resources :cities

  resources :countries

  resources :banks do
    collection { post :import }
  end
  get '/clients/get_banks', to: 'clients#get_banks', as: :get_banks


  resources :clients

  root to: 'users#index'




end
