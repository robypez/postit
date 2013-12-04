PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: [:show, :edit, :update, :index, :new, :create]
end
