Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:create, :update, :destroy] do
      resource :profile, only: :show
    end
    resource :session, only: [:create, :destroy]
    resources :rooms, except: [:new, :edit] do
      resources :messages, only: [:create, :index]
    end
  end
end
