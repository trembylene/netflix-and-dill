Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :bookings, only: [:index]
  end
  resources :plants do
    collection do
      get "search"
      get :my
    end
    resources :bookings, only: [:create, :edit, :update, :destroy]
  end
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
