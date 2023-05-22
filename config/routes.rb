Rails.application.routes.draw do
  devise_for :users
  
  root to: "prototypes#index"

  resources :users, only: :show
  resources :prototypes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
