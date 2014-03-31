class TodosController < ApplicationController

  def create
    @list = List.find params[:list_id]
    @todo = @list.todos.build(todo_params)
    if @todo.save
    flash[:success] = 'Your new TODO was saved'
    redirect_to @list
    else
    flash[:error] = "Error creating TODO. Please try again."
    redirect_to @list
    end 
  end

  def complete
    @list = List.find(params[:list_id])
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       if t.status?
        t.update_attribute(:status, false)
       else
        t.update_attribute(:status, true)
       end
     end
    redirect_to @list
 end

  private 
  def todo_params 
    params.require(:todo).permit(:description, :list_id, :status)
  end

end