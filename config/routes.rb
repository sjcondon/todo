Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post 'users', to: 'users#create'

  resources :todo_lists do
    resources :todo_items do
    	member do
    		patch :complete
    	end
    end
  end
  root 'todoitem#index'
end
