Rails.application.routes.draw do
  resources :contacts, only: [:new, :create]
  root "contacts#new"
  get '/contacts' => "contacts#new"
  namespace :api, defaults: { format: :json } do
  	resources :contacts, only: [:create]
  end
  get '*unmatched_route', to: 'application#route_not_found'
end
