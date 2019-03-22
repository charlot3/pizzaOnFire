Rails.application.routes.draw do

  get 'users/new'

  get '/help', to: 'static_pages#help'

  get '/menu', to: 'static_pages#menu'

  get '/about', to: 'static_pages#about'

  get '/factory', to: 'static_pages#factory'

  get '/manage', to: 'static_pages#manage'

  get '/signup', to: 'users#new'

  root 'static_pages#home'
end
