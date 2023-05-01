# frozen_string_literal: true

# TODO: 最低限のログイン機能が出来上がったら、テスト対象にする
# :nocov:
module Api
  # api/ 以下のコントローラーの継承元
  class ApplicationController < ActionController::API
    rescue_from(ActiveRecord::RecordInvalid) { render_bad_request(_1.message) }
    rescue_from(ActiveRecord::RecordNotFound, with: :render_not_found_error)

    private

    def render_success(message = 'success')
      render json: { message: message }, status: :ok
    end

    def render_bad_request(message = 'bad request')
      render json: { error_message: message }, status: :bad_request
    end

    def render_not_found_error
      render json: { message: 'not found' }, status: :not_found
    end

    def render_unauthorized_error
      render json: { message: "You can't use service." }, status: :unauthorized
    end
  end
end
# :nocov:
