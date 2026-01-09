Rails.application.routes.draw do
  get "checkouts/new"
  get "checkouts/create"

  root "books#index"

 # Books collection routes
  get    '/books', to: 'books#index', as: :library_books
  get    '/books/new', to: 'books#new', as: :new_library_book
  post   '/books', to: 'books#create'

  # Individual book routes
  get    '/books/:id', to: 'books#show', as: :library_book
  get    '/books/:id/edit', to: 'books#edit', as: :edit_library_book
  patch  '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy'

  get '/checkout', to: 'checkouts#new', as: :checkout
  post '/checkout', to: 'checkouts#create'

  get '/rentals/history', to: 'rentals#history', as: :rentals_history




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
