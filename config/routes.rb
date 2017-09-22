Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root "journeys#new"

  namespace :api do
    namespace :v1 do
      resources :journeys, only: [:show]
    end
  end

  resources :journeys, only: [:new, :create, :index, :show, :destroy]
end
