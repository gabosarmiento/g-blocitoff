class TodosController < ApplicationController
  
  def create
    @list = List.find params[:list_id]
    @todo = @list.todos.build(todo_params)
    authorize @todo
    if @todo.save
    flash[:success] = 'Your new TODO was saved'
    redirect_to @list
    else
    flash[:error] = "Error creating TODO. Please try again."
    redirect_to @list
    end 
  end

  def destroy
    @todo = Todo.find(params[:id])
    @list = List.find(params[:list_id])
     name = @todo.description
     authorize @todo
    if @todo.destroy
      flash[:success] = "\"#{name}\" was deleted successfully."
      redirect_to @list
      else
      flash[:error] = "There was an error deleting the list."
      redirect_to @list
    end
  end

  def complete
    @list = List.find(params[:list_id])
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       t.update_attribute(:status, !t.status)
     end
    redirect_to @list
 end

  private 
  def todo_params 
    params.require(:todo).permit(:description, :list_id, :status)
  end

end