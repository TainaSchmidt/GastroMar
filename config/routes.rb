Rails.application.routes.draw do
  # Define a página inicial do seu site (http://localhost:3000)
  root "catalogo#index"
  #get "pescados/new"
  #get "pescados/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Rotas do Login
  get "login", to: "sessoes#new"
  post "login", to: "sessoes#create"
  delete "logout", to: "sessoes#destroy"

  # Rotas para o pescador (CRUD completo: index, show, new, create, edit, update, destroy)
  resources :pescados

  # Rotas para o restaurante (Apenas ver catálogo e detalhes)
  resources :catalogo, only: [:index, :show], path: "catalogo"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
