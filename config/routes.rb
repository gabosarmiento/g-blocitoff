GBlocitoff::Application.routes.draw do

  resources :lists, only: [:index, :create, :show] do
    resources :todos, only: [:create] 
  end

  # Custom complete route
  post "/lists/:list_id/todos/complete" => "todos#complete", as: "todos_complete"
end
