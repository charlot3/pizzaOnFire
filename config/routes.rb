Rails.application.routes.draw do

  get 'refund/new'

  get 'product/new'

  get 'food/new'

  get 'sessions/new'

  get 'manage/new'

  get 'factory/new'

  post 'factory/update'

  post 'factory/create'

  get '/menu', to: 'menu#new'

  get 'orders/new'

  get 'users/new'

  get 'menu/change'

  get 'food/new'

  get 'product/new'

  get 'refund/new'

  get 'userinfo/new'

  get '/help', to: 'static_pages#help'

  get '/menutmp', to: 'static_pages#menu'

  get '/about', to: 'static_pages#about'

  get '/factory', to: 'static_pages#factory'

  get '/manage', to: 'static_pages#manage'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'


  post 'manage/update'

  post 'manage/create'

  post 'menu/update'

  post 'menu/create'

  post 'orders/create'

  post 'orders/check'

  post 'orders/update'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  root 'static_pages#home'
  resources :users
  resources :orders
  resources :menu
  resources :factory
  resources :manage
end
