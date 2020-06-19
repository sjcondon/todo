Rails.application.routes.draw do
  root "welcome#home"

  resources :todo_lists do
    resources :todo_items            #loop through and will give the correct item (nested route)
    
      end
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'


  end


