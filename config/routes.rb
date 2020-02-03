Rails.application.routes.draw do
  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'
  get 'auth/test', to: 'users#test'

  resources :tasks do
    resources :todo
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
