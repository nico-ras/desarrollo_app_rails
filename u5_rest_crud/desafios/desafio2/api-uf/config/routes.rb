Rails.application.routes.draw do

  resources :user_requests
  resources :clients
  resources :ufs, param: :date  #desde aqui cambiamos el parametro de la ruta de :id a :date 

  root 'ufs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
