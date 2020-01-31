Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'sessions/new'
  get 'users/new'
    root 'static_pages#home'
    get  '/about',   to: 'static_pages#about'
    get  '/contact', to: 'static_pages#contact'
    get  '/signup', to: 'users#new'
    post '/signup',  to: 'users#create'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete  '/logout',  to: 'sessions#destroy'
    resources :users
    resources :shops
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    get  '/likes', to: 'shops#likes'
    get '/search', to: 'shops#search'
end
