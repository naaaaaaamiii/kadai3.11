Rails.application.routes.draw do
  devise_for :users
  
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  
  resources :books, only: [:index, :show, :edit, :create, :destroy]
  resources :users, only: [:show, :edit, :index, :update, :create]
  
  post 'users/:id' => 'users#show'
 # post 'books/:id' => 'books#show'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end