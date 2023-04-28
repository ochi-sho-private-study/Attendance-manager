# frozen_string_literal: true

module Api
  module ConvenienceStore
    # ログイン情報のAPI
    class SessionsController < ApplicationController
      skip_before_action :authenticate_login_store, only: %i[create]

      def show
        @store = current_store
        render json: @store
      end

      def create
        store = Store.find_by(id: create_params[:store_id])
        return render_not_found_error if store.nil?

        if store.authenticate(create_params[:password])
          session[:store_id] = store.id
          render_success('ログインに成功しました。')
        else
          render_bad_request('ログインに失敗しました。')
        end
      end

      def destroy
        reset_session
        render_success
      end

      private

      def create_params
        params.deep_transform_keys(&:underscore)
      end
    end
  end
end
