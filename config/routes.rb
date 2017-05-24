
            Rails.application.routes.draw do
  resources :comments
            mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
              match '/users',   to: 'users#index',   via: 'get'
              match '/users/:id',     to: 'users#show',       via: 'get'
              match '/memes/',        to: 'memes#index',      via: 'get'
              match '/memes/edit',        to: 'memes#edit',      via: 'get'
              match "/memes/edit",     to: 'memes#update',      via: 'post'



             


              devise_for :users, :path_prefix => 'd', controllers: { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }
              

              resources  :pins do

                member do
                  put "like",    to: "pins#upvote"
                  put "dislike", to: "pins#downvote"
                end
              resources :comments
              end
              
              resources :users do
                member do
                  get :pins
                end
              end

              root "pins#index"
            end