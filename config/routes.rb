Rails.application.routes.draw do
  resources :users do
    resources :tasks
  end

  post '/register', to: 'users#register'
  post '/login', to: 'sessions#login'
end
