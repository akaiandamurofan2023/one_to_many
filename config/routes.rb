Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member 
  end  

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
 #   resource :comment, only: [:create, :destroy]
  end
    
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
