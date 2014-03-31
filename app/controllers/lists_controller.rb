class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
    flash[:success] = 'Your new List was saved'
    redirect_to @list
    else
    flash[:error] = "Error creating list. Please try again."
    render lists_path
    end 
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
    @todo = Todo.new
  end

  private
  def list_params 
    params.require(:list).permit(:name)
  end


end
