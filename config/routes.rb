Rails.application.routes.draw do
  devise_for :users
  devise_for :property_owners
  root to: 'home#index'
  get 'my_profile', to: 'users#my_profile'
  resources :properties, only: [:show, :new, :create] do
    get 'my_properties', on: :collection
    resources :property_books, only: [:create, :show], shallow: true
  end
  resources :property_types, only: [:new, :create, :show]
  resources :property_locations, only: [:new, :create, :show]
end
