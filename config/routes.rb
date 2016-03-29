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

      resources :men, only: :index

      resources :women, only: :index

      resources :users, only: :index
    end

    resources :products, except: [:new, :edit] do
      resources :comments, only: [:create, :index]
    end

    resources :comments, only: [] do
      resources :replies, only: [:create, :index]
    end

    resources :purchases, except: [:new, :edit]

    resources :orders, except: [:new, :update, :edit]
  end
end
