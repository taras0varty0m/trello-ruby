# frozen_string_literal: true

module Api
  module V1
    class CommentsController < AuthenticationController
      before_action :authenticate_user!, except: %i[index show]

      def index
        render json: ::Comment.all, status: :ok
      end

      def show
        comment = ::Comment.find params[:id]
        render json: comment, status: :ok
      end

      def create
        comment = Api::V1::Comment::CreateCommentService.new(
          params[:text],
          params[:card_id],
          current_user.id
        ).call
        render json: comment, status: :created
      end

      def update
        Api::V1::Comment::UpdateCommentService.new(params[:id], params[:text]).call
        render json: { message: 'Comment successfully updated' }, status: :ok
      end

      def destroy
        Api::V1::Comment::DeleteCommentService.new(params[:id]).call
        render json: { message: 'Comment successfully deleted' }
      end
    end
  end
end
