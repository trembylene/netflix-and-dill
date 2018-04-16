Rails.application.routes.draw do
  get 'plants/index'

  get 'plants/new'

  get 'plants/edit'

  devise_for :users
  resources :users
  resources :bookings
  resources :plants
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
