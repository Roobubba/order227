Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'posts#home'
  
  get '/bio', to: 'pages#bio', as: 'bio'
  get '/news', to: 'posts#index', as: 'news'
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
  
  resources :users, except: [:new] do
    member do
      get :confirm_email
    end
  end
  
  resources :password_resets, except: [:show, :index]

  get '/register', to: 'users#new'
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  get '/home', to: 'posts#home'
  get '/dlemail', to: 'users#download_all_emails'
  
  
  resources :posts, except: [:show]
  resources :pictures, except: [:show]
  
  resources :shows
  resources :bands
  resources :venues, except: [:show]
  resources :videos
  resources :releases
  resources :release_types, except: [:show]
  resources :tracks
  
end
