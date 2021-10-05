Rails.application.routes.draw do
  devise_for :users
  devise_for :property_owners
  root to: 'home#index'
  resources :properties, only: [:show, :new, :create] do
    get 'my_properties', on: :collection
  end
  resources :property_types, only: [:new, :create, :show]
  resources :property_locations, only: [:new, :create, :show]
end
