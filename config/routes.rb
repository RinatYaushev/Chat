Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:create, :show]
    resource :profile, only: [:show, :update]
    resource :session, only: [:create, :destroy]
    resources :rooms, except: [:new, :edit] do
      resources :messages, only: [:create, :index]
      resources :pings, only: [:create, :index]
    end
  end
end
