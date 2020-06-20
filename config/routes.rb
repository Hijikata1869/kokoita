Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'static_pages#home'
  get  'help', to: 'static_pages#help'
  get  'about', to: 'static_pages#about'
  get  'contact', to: 'static_pages#contact'
  get  'users/:id', to: 'users#show'
  
  
end