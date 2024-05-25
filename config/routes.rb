# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'tasks#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
  resource :tasks
end
