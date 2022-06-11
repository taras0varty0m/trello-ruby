# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < AuthenticationController
      before_action :authenticate_user!, except: %i[index show]

      def index
        render json: ::Column.all
      end

      def show
        column = ::Column.find params[:id]
        render json: column
      end

      def create
        column = Api::V1::Column::CreateColumnService.new(
          params[:title],
          current_user.id
        ).call
        render json: column
      end

      def update
        Api::V1::Column::UpdateColumnService.new(
          params[:id],
          params[:title]
        ).call
        render json: { message: 'Column successfully updated' }
      end

      def destroy
        Api::V1::Column::DeleteColumnService.new(params[:id]).call
        render json: { message: 'Column successfully deleted' }
      end
    end
  end
end
