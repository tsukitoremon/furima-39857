Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'devise/registrations' }
  root to: "items#index"
  resources :items
  resources :users, only: [:index, :new, :create, :destroy]

end
