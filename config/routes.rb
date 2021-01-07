Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only: [:show]
  resources :posts do
    resource :likes, only: %i[create destroy]
    resource :comments, only: %i[create destroy]
  end
  root 'static_pages#home'
  get  'help', to: 'static_pages#help'
  get  'about', to: 'static_pages#about'
  get  'contact', to: 'static_pages#contact'
  post 'posts/new', to: 'posts#create'
  get  'search', to: 'posts#search'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
