Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  post 'books' => 'books#create'   #ここを追記します

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :index, :update]

  get "/home/about" => "homes#about", as: "about"
#  get "/bookers2" =>  'homes#top'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
