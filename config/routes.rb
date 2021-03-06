Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#landing'

  resources :products do
    resources :reviews, except: [:index, :new, :show]
  end

  resources :users, only: [:new, :create]
  resource :users, only: [:edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
end
