# frozen_string_literal: true

module Api
  module ConvenienceStore
    # api/convenience_store/ 以下のコントローラーの継承元
    class ApplicationController < Api::ApplicationController
      before_action :authenticate_login_store

      private

      def current_store
        Store.find_by(id: session[:store_id])
      end

      def authenticate_login_store
        render_unauthorized_error unless current_store
      end
    end
  end
end
