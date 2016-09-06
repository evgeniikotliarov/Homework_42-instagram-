Rails.application.routes.draw do
  root 'instaposts#index'

  devise_for :users
  
  post 'relationships/create'

  delete 'relationships/destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users do
  collection do
    get :tigers
    end
  end

  resources :users
  resources :sessions,   only: [:new, :create, :destroy]
  resources :instaposts, only: [:create, :destroy]

  

  resources :sessions,      only: [:new, :create, :destroy]
  resources :instaposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]


  resources :instaposts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
