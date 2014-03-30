GBlocitoff::Application.routes.draw do

  resources :lists, only: [:index, :new, :create, :show, :edit] do
    resources :todos, only: [:new, :create, :show]
  end
end
