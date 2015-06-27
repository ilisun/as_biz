Rails.application.routes.draw do
  resources :cities

  resources :countries

  resources :banks do
    collection { post :import }
  end


  devise_for :users
  resources :clients

  root to: 'users#index'



end
