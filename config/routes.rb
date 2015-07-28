Rails.application.routes.draw do
  devise_for :users

  get '/clients/get_banks',       to: 'clients#get_banks',        as: :get_banks
  get '/clients/get_cities',      to: 'clients#get_cities',       as: :get_cities
  get '/clients/get_clients',     to: 'clients#get_clients',      as: :get_clients
  get '/autos/get_models',        to: 'autos#get_models',         as: :get_models
  get '/autos/get_generations',   to: 'autos#get_generations',    as: :get_generations
  get '/autos/get_series',        to: 'autos#get_series',         as: :get_series
  get '/autos/get_modifications', to: 'autos#get_modifications',  as: :get_modifications

  resources :countries
  resources :autos
  resources :orders
  resources :users
  resources :delivery_products

  resources :clients            do
    member {
                 get :select_client, action: :select_client, :as => :select_client
    }
  end
  resources :settings           do
    collection {
                 get  :set_auto
                 get  :set_bank
                 get  :set_city
                 get  :set_delivery
    }
  end
  resources :car_series         do
    collection { post :import }
  end
  resources :car_modifications  do
    collection { post :import }
  end
  resources :car_models         do
    collection { post :import }
  end
  resources :car_marks          do
    collection { post :import }
  end
  resources :car_generations    do
    collection { post :import }
  end
  resources :banks              do
    collection { post :import }
  end
  resources :deliveries         do
    collection { post :import }
  end
  resources :products           do
    collection {
                 get  :compare
                 put  :update_compare
    }
  end
  resources :cities             do
    collection { post :import }
  end
  resources :countries          do
    collection { post :import }
  end

  root to: 'users#index'
end
