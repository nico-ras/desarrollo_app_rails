Rails.application.routes.draw do
  #rutas POST
  post 'greetings', to: 'greetings#hello'
  post 'byebye', to: 'greetings#bye', as: 'chao'
  #rutas GET
  get 'say_hello', to: 'greetings#say_hello'
  #nuevas rutas
  post :add, to: 'calculator#compute_add'
  get :add, to: 'calculator#add'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
