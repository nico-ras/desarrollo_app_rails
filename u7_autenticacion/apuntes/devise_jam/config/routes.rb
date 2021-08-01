Rails.application.routes.draw do
  resources :jams
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
