# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :convenience_store do
      resource :session, only: %i[create destroy] do
        collection do
          get :show
        end
      end
      resources :employees, only: %i[create index]
      resources :positions, only: %i[index show create update destroy]
    end
  end
end
