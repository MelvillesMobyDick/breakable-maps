Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "journeys#new"

  resources :journeys, only: [:new, :create, :index, :show, :destroy]
end
