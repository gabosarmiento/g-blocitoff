GBlocitoff::Application.routes.draw do

  devise_for :users
  root :to => "home#index"
  
  resources :lists, only: [:index, :create, :show, :destroy] do
    resources :todos, only: [:create, :destroy] 
  end

  # Custom complete route
  post "/lists/:list_id/todos/complete" => "todos#complete", as: "todos_complete"
end
