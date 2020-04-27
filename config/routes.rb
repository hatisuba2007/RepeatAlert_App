Rails.application.routes.draw do
  get "/"            => 'static_pages#home'
  get  '/signup'     => 'salons#new'
  post  '/signup'    => 'salons#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'  
  resources :salons
  resources :users
  resources :products
  resources :purchases
end