Rails.application.routes.draw do
  resources :users, only: [:create, :update]

  resources :orders, only: [:index, :create, :update]

  resources :companies, only: [:index, :create] do
    resources :products, only: [:index, :create]
  end

  get 'me', to: 'users#show'
  post 'auth/signin', to: 'authentication#authenticate'
end
