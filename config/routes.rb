Rails.application.routes.draw do
  devise_for :users
  
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  
  resources :books, only: [:index, :show, :edit, :create,]
  resources :users
  
  post 'users/:id' => 'users#show'
  post 'books/:id' => 'books#show'
  
  delete 'books/:id' => 'books#destroy'
  
  patch 'users/:id/edit' => 'users#update'
  patch 'books/:id/edit' => 'books#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end