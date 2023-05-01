# frozen_string_literal: true

module Api
  module ConvenienceStore
    # 部署マスタのAPI
    class PositionsController < ApplicationController
      def index
        @positions = current_store.positions
      end

      def show
        @position = current_store.positions.find(params[:id])
      end

      def create
        @position = current_store.company.positions.create!(position_params)
        render :show
      end

      def update
        @position = current_store.positions.find(params[:id])
        @position.update!(position_params)
        render :show
      end

      def destroy
        @position = current_store.positions.find(params[:id]).destroy!
      end

      def position_params
        params.require(:position).permit(:name)
      end
    end
  end
end
