Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users do
    resources :relationships, only: [:create, :destroy]
  end
  
  get '/home/about', to: 'homes#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
