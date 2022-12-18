Rails.application.routes.draw do
  devise_for :users #, sign_out_via: [:get, :delete]
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :new, :create, :destroy] do
          resources :comments, except: [edit, update]
        end
      end
    end
  end
  # Defines the root path route ("/")
end
