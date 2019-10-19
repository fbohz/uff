Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  
  resources :walls 
    
  resources :artists do
    resources :walls, shallow: true
  end

  resources :locations

  resources :artist_walls, only: [:update]

  get '*unmatched_route', to: 'application#not_found'

end
