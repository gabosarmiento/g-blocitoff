GBlocitoff::Application.routes.draw do

  resources :lists, only: [:index, :new, :create, :show, :edit] do
    resources :todos, only: [:new, :create, :show] 
  end

  # Custom complete route
  post "/lists/:list_id/todos/complete" => "todos#complete", as: "todos_complete"
end
