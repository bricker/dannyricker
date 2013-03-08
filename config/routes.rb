Danny::Application.routes.draw do
  root to: 'pages#show', defaults: { id: "homepage" }

  resources :posts
  resources :pages, except: [:show]

  resource :session, only: [:create, :destroy]
  get 'login' => 'sessions#new', as: "login"
  get 'logout' => 'sessions#destroy', as: "logout"
  
  get ':id' => 'pages#show', as: "show_page"
end
