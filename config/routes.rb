Rails.application.routes.draw do
  devise_for :users
  resources :cities
  resources :countries
  resources :autos
  resources :clients

  resources :settings do
    collection { get :set_auto }
  end

  resources :car_series do
    collection { post :import }
  end
  resources :car_modifications do
    collection { post :import }
  end
  resources :car_models do
    collection { post :import }
  end
  resources :car_marks do
    collection { post :import }
  end
  resources :car_generations do
    collection { post :import }
  end

  resources :banks do
    collection { post :import }
  end

  get '/clients/get_banks', to: 'clients#get_banks', as: :get_banks
  get '/clients/get_cities', to: 'clients#get_cities', as: :get_cities

  root to: 'users#index'
end
