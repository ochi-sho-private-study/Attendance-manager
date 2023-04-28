# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3100'
    resource '*',
             methods: %i[get post patch put delete],
             headers: :any,
             credentials: true
  end
end
