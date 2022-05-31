# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < AuthenticationController
      before_action :authenticate_api_v1_user!, except: %i[index show]

      def index
        columns = ::Column.all
        render json: { columns: columns }, status: :ok
      end

      def show
        column = ::Column.find params[:id]
        render json: { column: column }, status: :ok
      end

      def create
        ActiveRecord::Base.transaction do
          column = Api::V1::Column::CreateColumnService.new(
            params[:title],
            current_api_v1_user.id
          ).call
          render json: { column: column }
        end
      rescue StandardError => e
        render json: { error: e }
      end
    end
  end
end
