class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
    authorize @list
  end

  def create
    @list = current_user.lists.build(list_params)
    authorize @list
    if @list.save
    flash[:success] = 'Your new List was saved'
    redirect_to @list
    else
    flash[:error] = "Error creating list. Please try again."
    redirect_to lists_path
    end 
  end

  def show
    @list = List.find(params[:id])
    authorize @list
    @todos = @list.todos
    @todo = Todo.new
  end

  def destroy
    @list = List.find(params[:id])
     name = @list.name
     authorize @list
    if @list.destroy
      flash[:success] = "\"#{name}\" was deleted successfully."
      redirect_to lists_path
      else
      flash[:error] = "There was an error deleting the list."
      render lists_path
    end
  end

  private
  def list_params 
    params.require(:list).permit(:name)
  end


end
