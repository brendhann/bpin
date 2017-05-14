
            Rails.application.routes.draw do
  resources :comments
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
              match '/users',   to: 'users#index',   via: 'get'
              match '/users/:id',     to: 'users#show',       via: 'get'
              match '/memes/',        to: 'memes#index',      via: 'get'
              match '/memes/edit',        to: 'memes#edit',      via: 'get'
              match "/memes/edit",     to: 'memes#update',      via: 'post'

             




              

              devise_for :users, :path_prefix => 'd'
              resources  :pins do

                member do
                  put "like",    to: "pins#upvote"
                end
              resources :comments
              end
              
              resources :users, :only =>[:show]

              root "pins#index"
            end