Rails.application.routes.draw do
  devise_for :users #, sign_out_via: [:get, :delete]
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
