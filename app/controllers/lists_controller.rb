class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    flash[:success] = 'Your new List was saved'
    redirect_to @list
    else
    flash[:error] = "Error creating list. Please try again."
    render :new
    end 
  end

  def show
    @list = List.find(params[:id])
    @todos = @list.todos
    @todo = Todo.new
  end

  def edit
  end

  private
  def list_params 
    params.require(:list).permit(:name)
  end

end
