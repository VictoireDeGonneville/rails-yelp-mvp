Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :new, :create, :show, :destroy] do
    resources :reviews, only: [:index, :new, :create]
  end
  root to: 'restaurants#index'
  resources :reviews, only: :destroy
end
