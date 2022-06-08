# frozen_string_literal: true

module Api
  module V1
    class CommentsController < AuthenticationController
      before_action :authenticate_api_v1_user!, except: %i[index show]

      def index
        render json: ::Comment.all
      end

      def show
        comment = ::Comment.find params[:id]
        render json: comment
      end

      def create
        ActiveRecord::Base.transaction do
          comment = Api::V1::Comment::CreateCommentService.new(
            params[:text],
            params[:card_id],
            current_api_v1_user.id
          ).call
          render json: { comment: comment }
        end
      rescue StandardError => e
        render json: { error: e }
      end

      def update
        Api::V1::Comment::UpdateCommentService.new(
          params[:id],
          params[:text],
          current_api_v1_user.id
        ).call
        render json: { message: 'Comment successfully updated'}
      rescue StandardError => e
        render json: { error: e }, status: 403
      end
    end
  end
end
