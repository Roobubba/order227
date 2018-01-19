Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#index'
  
  get '/bio', to: 'pages#bio', as: 'bio'
  get '/news', to: 'pages#news', as: 'news'
  get '/music', to: 'pages#music', as: 'music'  
  get '/gallery', to: 'pages#gallery', as: 'gallery'
  get '/contact', to: 'pages#contact', as: 'contact'
  get '/siteadmin', to: 'pages#siteadmin', as: 'siteadmin'

  #get '/users', to: 'users#index'
  #get '/users/new', to: 'users#new', as: 'sign_up'
  #post '/users', to: 'users#create'
  #get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  #patch '/users/:id', to: 'users#update'
  #get '/users/:id', to: 'users#show', as: 'user'
  #delete '/users/:id', to: 'users#destroy'
  
  resources :users, except: [:new]

  get '/register', to: 'users#new'
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
  resources :posts, except: [:show]
  resources :pictures
  resources :shows
  resources :bands
  resources :venues, except: [:show]
  resources :videos
  resources :releases, except: [:show]
  resources :release_types, except: [:show]
  resources :tracks, except: [:show]
  
  
end
