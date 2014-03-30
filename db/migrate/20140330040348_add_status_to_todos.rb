class AddStatusToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :status, :boolean
  end
end
