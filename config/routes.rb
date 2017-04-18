Rails.application.routes.draw do
  resources :users do
    resources :orders
  end

  resources :companies do
    resources :products
  end

  post 'auth/signin', to: 'authentication#authenticate'
end
