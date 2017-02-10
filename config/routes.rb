Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/new'

  root   'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
end
