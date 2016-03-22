Rails.application.routes.draw do
  namespace :api do
    concern :votable do
      post :vote, to: 'votes#create'
    end

    resources :users, only: [:create, :show]

    resource :profile, only: [:show, :update] do
      resource :avatar, only: :update
    end

    resource :session, only: [:create, :destroy]

    resources :rooms, except: [:new, :edit], shallow: true do
      resources :messages, only: [:create, :index] do
        concerns :votable
      end

      resources :pings, only: [:create, :index] do
        concerns :votable
      end

      resources :pictures, only: [:create, :index] do
        concerns :votable
      end
    end

    resources :products, except: [:new, :edit]
  end
end
