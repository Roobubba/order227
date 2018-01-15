Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#home'
  
  get '/home', to: 'pages#home', as: 'home'
  get '/bio', to: 'pages#bio', as: 'bio'
  get '/news', to: 'pages#news', as: 'news'
  get '/music', to: 'pages#music', as: 'music'  
  get '/videos', to: 'pages#videos', as: 'videos'
  get '/gallery', to: 'pages#gallery', as: 'gallery'
  get '/shows', to: 'pages#shows', as: 'shows'
  get '/contact', to: 'pages#contact', as: 'contact'

  #get '/users', to: 'users#index'
  #get '/users/new', to: 'users#new', as: 'sign_up'
  #post '/users', to: 'users#create'
  #get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  #patch '/users/:id', to: 'users#update'
  #get '/users/:id', to: 'users#show', as: 'user'
  #delete '/users/:id', to: 'users#destroy'
  
  resources :users, except: [:new, :destroy, :show]

  get '/register', to: 'users#new'
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
  
  
end
