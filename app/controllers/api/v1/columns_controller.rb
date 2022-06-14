# frozen_string_literal: true

module Api
  module V1
    class ColumnsController < AuthenticationController
      before_action :authenticate_user!, except: %i[index show]

      def index
        render json: ::Column.all, status: :ok
      end

      def show
        column = ::Column.find params[:id]
        render json: column, status: :ok
      end

      def create
        column = Api::V1::Column::CreateColumnService.new(params[:title], current_user.id).call
        render json: column, status: :created
      end

      def update
        Api::V1::Column::UpdateColumnService.new(params[:id], params[:title]).call
        render json: { message: 'Column successfully updated' }, status: :ok
      end

      def destroy
        Api::V1::Column::DeleteColumnService.new(params[:id]).call
        render json: { message: 'Column successfully deleted' }, status: :no_content
      end
    end
  end
end
