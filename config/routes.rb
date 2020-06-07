Rails.application.routes.draw do
  resources :todo_lists
  resources :todo_lists do
    resources :todo_items do #loop through and will give the correct item (nested route)
    	member do
    		get :complete
      end
    end
  end


  resources :sessions, only: [:create, :new, :destroy]
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  post '/users', to: 'users#create'
  post '/sessions', to: "sessions#create"

  
  root "welcome#home"
end

