class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  # before_action :authenication_required
  
  def index
      @todo_lists = TodoList.all
      @todo_lists = TodoList.ordered_by_title
  end

  def show
  end
  
  def new
    @todo_list = TodoList.new
  end

  def edit
  end


  def create
    @todo_list = TodoList.new(todo_list_params)
    @todo_list.creator_id = session[:current_user_id]
      if @todo_list.save
        redirect_to todo_list_path(@todo_list)
      else
        render :new
    end
  end

  
  def update
      if @todo_list.update(todo_list_params)
        redirect_to todo_list_path(@todo_list)
      else
        render :edit
      end
  end


  
  def destroy
    @todo_list.destroy
    redirect_to todo_lists_path
  end
  

  private
    
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:title, :description, :search)
    end
  end
