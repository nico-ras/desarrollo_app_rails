Rails.application.routes.draw do
  
  resources :bands do
    resources :concerts 
  end
  root 'bands#index'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
