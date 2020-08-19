Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  root 'static_pages#home'
  get  'help', to: 'static_pages#help'
  get  'about', to: 'static_pages#about'
  get  'contact', to: 'static_pages#contact'
  post 'posts/new', to: 'posts#create'
  get  'search', to: 'posts#search'
  
  
end