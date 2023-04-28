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
    end
  end
end
