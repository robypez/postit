PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: [:destroy] do
    resources :comments, only: [:new, :create, :show, :index] 
  end
  resources :categories, except: [:destroy]
  resources :users, only: [:show]
end
