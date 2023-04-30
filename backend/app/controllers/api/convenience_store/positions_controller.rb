# frozen_string_literal: true

module Api
  module ConvenienceStore
    # 部署マスタのAPI
    class PositionsController < ApplicationController
      def index
        positions = current_store.positions
        render json: positions
      end
    end
  end
end
