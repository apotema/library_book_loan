# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books, only: %i[index] do
    resource :reservations, only: %i[create]
  end
  devise_for :users

  root to: 'home#index'
end
