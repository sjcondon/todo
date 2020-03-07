Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post 'users', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/sessions', to: "sessions#create"

  resources :todo_lists do
    resources :todo_items do
    	member do
    		patch :complete
    	end
    end
  end
  root 'application#home'
end
