class TodosController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def show
  end

  # GET ACTION
  def new
    @todo = Todo.new
  end

  # POST ACTION
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'Your todo was created.'
      redirect_to root_path
    else
      flash[:notice] = 'Oops...something went wrong'
      render 'new'
    end

  end

  def edit
  end

  def update
    if @todo.update_attributes(todo_params)
      flash[:notice] = "Your todo was updated."
      redirect_to todo_path
    else
      flash[:notice] = 'Oops...something went wrong'
      render 'edit'
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def set_task
    @todo = Todo.find(params[:id])
  end
end
