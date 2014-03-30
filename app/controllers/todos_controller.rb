class TodosController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @todo = Todo.new
  end

  def create
    @list = List.find params[:list_id]
    @todo = Todo.new(todo_params)
    @todo.list = @list
    if @todo.save
    redirect_to @list, notice: 'Your new TODO was saved'
    else
    flash[:error] = "Error creating to-do. Please try again."
    render :new
    end 
  end

  def show 
    @list = List.find(params[:list_id])
    @todo = Todo.find params[:id]
  end

  private 
  def todo_params 
    params.require(:todo).permit(:description)
  end
end