Rails.application.routes.draw do
  get 'create/destroy'
  devise_for :users

  root to: "homes#top"
  get 'home/about' => 'homes#about'

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
     resource :favorites, [:create, :destroy]
  end

  resources :users

 # delete 'books/:id' => 'books#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end