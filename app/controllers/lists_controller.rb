class ListsController < ApplicationController
  def index
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    redirect_to @list, notice: 'Your new List was saved'
    else
    flash[:error] = "Error creating list. Please try again."
    render :new
    end 
  end

  def show
    @list = List.find params[:id]
  end

  def edit
  end

  private
  def list_params 
    params.require(:list).permit(:name)
  end

end
