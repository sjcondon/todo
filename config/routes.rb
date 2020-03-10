Rails.application.routes.draw do
  resources :todo_lists
  resources :todo_lists do
    resources :todo_items do
    	member do
    		get :complete
      end
    end
  end

  resources :todo_items, only: [:index, :destroy]
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create, :new, :destroy]
  
  get '/signup', to: 'users#new'
  post 'users', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/sessions', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  
  root "todo_lists#index"
end

