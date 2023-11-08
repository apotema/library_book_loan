# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :books, only: %i[index] do
    resource :reservations, only: %i[create]
  end

  resources :reservations, only: %i[index] do
    member do
      post :lend
      post :returned
    end
  end
  root to: 'home#index'
end
