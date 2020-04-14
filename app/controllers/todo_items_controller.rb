class TodoItemsController < ApplicationController
	# # before_action :set_todo_list
	# before_action :set_todo_item, except: [:create]

	def index
		@todo_items = TodoList.find(params[:todo_list_id]).todo_items.order(:title) #finding the list from the params via list.id then grabbing the .items from that list
	end

	
	def new
		@todo_list = TodoList.find(params[:todo_list_id])
		@todo_item = @todo_list.todo_items.build
	end

	def create
		@todo_list = TodoList.find(params[:todo_list_id])
		@todo_item = @todo_list.todo_items.build(todo_item_params)
		@todo_item.save
		redirect_to todo_list_path(@todo_list)
	end

	def destroy
		@todo_list = TodoList.find(params[:todo_list_id])
		@todo_item = TodoItem.find(params[:id])
		if @todo_item.destroy
			flash[:success] = "Todo List item was deleted."
		else
			flash[:error] = "Todo List item could not be deleted."
		end
		redirect_to @todo_list
	end

	def complete
		@todo_item.update_attribute(:completed_at, Time.now)
		redirect_to @todo_list, notice: "Todo item completed"
	end

	private

	def set_todo_item
		@todo_item = TodoItem.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:content)
	end
end


# resources => gives us a bunch of CRUD routes
# resources :todo_lists => gives us these routes:
# 	get '/todo_lists', to: 'todo_lists#index'
# 	get '/todo_lists/:id', to: 'todo_lists#show'
# resources :todo_lists do
# 	resources :todo_items
# end => gives us these routes:
# 	get '/todo_lists/:id/todo_items', 'todo_items#index'
# 	get '/todo_lists/:todo_list_id/todo_items/:id','todo_items#show'
