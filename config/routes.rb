Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :index, :show, :edit, :create]
  resources :users, only: [:show, :edit]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end