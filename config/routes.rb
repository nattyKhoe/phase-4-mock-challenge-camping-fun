Rails.application.routes.draw do
  get 'signups/create'
  resources :activities, only: [:index, :destroy]
  resources :campers, except: [:update, :edit, :destroy]
  resources :signups, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
