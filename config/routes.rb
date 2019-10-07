Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :artists do
    resources :walls, only: [:show, :index, :new, :edit]
  end

  resources :walls do
    resources :artists, only: [:show, :index]
  end

  resources :locations

end
