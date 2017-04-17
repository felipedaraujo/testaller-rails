Rails.application.routes.draw do
  resources :users, except: :create do
    resources :orders
  end

  resources :companies do
    resources :products
  end

  post 'auth/signin', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
