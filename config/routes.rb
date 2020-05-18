Rails.application.routes.draw do
  get '/contacts' => "contacts#new"
  resources :contacts, only: :new
  root "contacts#new"
  namespace :api, defaults: { format: :json } do
  	resources :contacts, only: [:create]
  end
  get '*unmatched_route', to: 'application#route_not_found'
end
