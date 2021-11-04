Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      post :auth, to: "authentication#create"
      post :reg, to: "registration#create"
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
  get 'frienships/index'
  root 'posts#index'

  devise_for :users

  resources :friendships, only: [:index,:create,:destroy] do
    member do
      put :confirm
    end
  end

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
